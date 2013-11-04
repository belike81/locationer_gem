# Locationer

## Add to gemfile
`gem 'locationer', github: 'belike81/locationer_gem'`

## Add route to your routes.rb file
`mount Locationer::Engine, at: '/locationer'`

## Run the installation script
`rake locationer:install`

## Access the location data API
`locationer/location_data/(*US or Mexico)/cities_nearby/(*city_name)`

* - provide your own value for this

## Use locationer in your own models
`city_finder = Locationer::CityFinder.new('US')`
to instantiate finder object with the desired country

`city_finder.nearby_cities(city: 'Los Angeles', state: 'CA')`
to get back an array of Locationer::GeoData objects


