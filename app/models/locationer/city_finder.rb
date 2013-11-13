module Locationer
  class CityFinder

    DEFAULT_RANGE = 10

    def initialize(country)
      @country = country || 'US'
    end

    def nearby_cities(*options)
      attributes = options.extract_options!
      range = attributes.fetch(:range) { DEFAULT_RANGE }
      if city = find_city_by(attributes)
        Locationer::GeoData.find_by_sql("select city_name, state from locationer_geo_data where sqrt(pow((longitude - #{city.longitude}) * cos(#{city.latitude} * pi() / 180),2) + pow(latitude - #{city.latitude},2)) * pi() * 7926.38 / 360 <= #{range}")
      else
        []
      end
    end

    private

    def find_city_by(attributes)
      city_name = attributes.fetch(:city) { raise ArgumentError, 'No city name provided' }
      reference = Locationer::GeoData.where("lower(country) = ? AND lower(city_name) = ?", @country.downcase, city_name.downcase)
      reference = reference.where(state: attributes[:state]) if attributes[:state]
      reference.first
    end
  end
end
