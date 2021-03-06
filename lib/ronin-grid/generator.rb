require 'fileutils'

module RoninGrid
  class Generator
    def initialize(args)
      @command = args.first
    end

    def run
      case @command
      when 'install'; install
      when 'install-bare'; install(true)
      when 'update'; update
      when 'uninstall'; uninstall
      when '-v'; version
      when '--version'; version
      else
        puts 'Usage: ronin-grid {install, update, uninstall, -v|--version}'
      end
    end

    def version
      puts RoninGrid::VERSION
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

    def install(bare = false)
      if ronin_installed?
        puts 'Ronin already installed, halting update.'
      else
        @bare = bare ? true : false
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
      Dir.exist?('ronin-grid')
    end

    def install_ronin
      make_lib_directory unless @bare
      copy_sass_files
    end

    def remove_ronin_directory
      FileUtils.rm_rf('ronin-grid')
    end

    def copy_sass_files
      FileUtils.cp_r(all_sass_files, install_dir)
    end

    def all_sass_files
      Dir["#{sass_dir}/*"]
    end

    def make_lib_directory
      FileUtils.mkdir_p(lib_directory)
    end

    def lib_directory
      'ronin-grid/lib/ronin-grid'
    end

    def install_dir
      @bare ? '.' : lib_directory
    end

    def sass_dir
      File.join(top_level_directory, 'app', 'assets', 'stylesheets')
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
