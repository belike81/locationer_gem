module Locationer
  class GeoData < ActiveRecord::Base
    attr_accessible :city_name, :latitude, :longitude, :state
  end
end
