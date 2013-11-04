module Locationer
  module LocationData
    class API < Grape::API
      version 'v1', using: :header, vendor: 'geodata'
      format :json

      resource :location_data do
        desc 'Return cities nearby'
        params do
          requires :city_name, type: String, desc: 'City name'
          optional :state, type: String, desc: 'State'
          optional :range, type: Integer, desc: 'Range', default: 10
        end
        get '/cities_nearby/:country/:city_name(/:range)(/:state)' do
          parsed_params = parse_params(params)
          Locationer::CityFinder.nearby_cities(parsed_params)
        end
      end

      private

      def parse_params(parameters)
        attributes = {}
        attributes[:country] = params.fetch(:country) { 'US' }
        attributes[:city] = params[:city_name].gsub('_',' ')
        attributes[:range] = params[:range]
        attributes[:state] = params[:state] if params[:state]
        attributes
      end
    end
  end
end
