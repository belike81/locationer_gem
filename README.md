# Locationer

## Add to gemfile
`gem 'locationer', github: 'belike81/locationer_gem'`

## Add route to your routes.rb file
`mount Locationer::Engine, at: '/locationer'`

## Copy over migrations
`rake locationer:install:migrations`

## Run copied migrations
`rake db:migrate`

## Run the import script
`rake locationer:import`

## Access the location data API
`locationer/location_data/cities_nearby/Atlanta`


