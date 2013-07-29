Locationer::Engine.routes.draw do
  mount Locationer::LocationData::API => '/'
end
