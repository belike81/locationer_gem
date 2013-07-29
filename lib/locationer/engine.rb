module Locationer
  class Engine < ::Rails::Engine
    isolate_namespace Locationer
    require 'grape'
    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app/api/*"]
  end
end
