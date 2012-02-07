require 'ronin-grid/version'
require 'ronin-grid/generator'

module RoninGrid
  if defined?(Rails)
    class Engine < ::Rails::Engine
      require 'ronin-grid/engine'
    end

    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load 'tasks/install.rake'
        end
      end
    end
  end
end
