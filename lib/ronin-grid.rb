require 'ronin-grid/version'
require 'ronin-grid/generator'

module RoninGrid
  if defined?(Rails)
    class Engine < ::Rails::Engine
      require 'ronin-grid/engine'
    end

    # Pointless, as _setup.scss cannot be overridden.
    # module Rails
      # class Railtie < ::Rails::Railtie
        # rake_tasks do
          # load 'tasks/install.rake'
        # end
      # end
    # end
  end
end
