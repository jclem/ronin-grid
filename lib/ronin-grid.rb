require 'ronin-grid/version'
require 'ronin-grid/generator'

module RoninGrid
  if defined?(Rails)
    class Engine < ::Rails::Engine
      require 'ronin-grid/engine'
    end
  end
end
