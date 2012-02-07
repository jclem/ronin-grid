require 'fileutils'

module RoninGrid
  class Generator
    def initialize(args)
      @command = args.first
    end

    def run
      case @command
      when 'install'; install
      when 'update'; update
      when 'uninstall'; uninstall
      end
    end

    def update
      if ronin_installed?
        remove_ronin_directory
        install_ronin
        puts 'Ronin updated.'
      else
        puts 'Ronin not found, halting update.'
      end
    end

    def install
      if ronin_installed?
        puts 'Ronin already installed, halting update.'
      else
        install_ronin
        puts 'Ronin installed into ronin-grid/'
      end
    end

    def uninstall
      if ronin_installed?
        remove_ronin_directory
        puts 'Ronin uninstalled.'
      else
        puts 'Ronin not installed.'
      end
    end

    private

    def ronin_installed?
      Dir.exist?('ronin_grid')
    end

    def install_ronin
      make_lib_directory
      copy_sass_files
    end

    def remove_ronin_directory
      FileUtils.rm_rf('ronin_grid')
    end

    def copy_sass_files
      FileUtils.cp_r(all_sass_files, 'ronin_grid/')
    end

    def all_sass_files
      Dir["#{sass_dir}/*"]
    end

    def make_lib_directory
      FileUtils.mkdir_p('ronin_grid/lib/ronin_grid')
    end

    def sass_dir
      File.join(top_level_directory, 'app', 'assets', 'stylesheets')
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
