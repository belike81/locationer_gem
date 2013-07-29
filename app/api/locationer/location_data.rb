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
        get '/cities_nearby/:city_name(/:range)(/:state)' do
          reference = Locationer::GeoData.where(city_name: params[:city_name])
          reference = reference.where(state: params[:state]) if params[:state]
          reference = reference.first
          if reference
            Locationer::GeoData.find_by_sql("select city_name, state from locationer_geo_data where sqrt(pow((longitude - #{reference.longitude}) * cos(#{reference.latitude} * pi() / 180),2) + pow(latitude - #{reference.latitude},2)) * pi() * 7926.38 / 360 <= #{params[:range]}")
          else
            "No nearby cities found"
          end
        end
      end
    end
  end
end
