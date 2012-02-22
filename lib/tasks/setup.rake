# Currently unusable, as it does not override existing file if ronin-grid is
# not explicitly installed via `rake ronin-grid:install`. Keeping around for
# future reference.
namespace :'ronin-grid' do
  desc "Install the app/assets/stylesheets/ronin-grid/_setup.scss file."
  task :setup, [:sass_path] do |t, args|
    args.with_defaults :sass_path => 'app/assets/stylesheets'
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    `mkdir -p #{Rails.root}/#{args.sass_path}/ronin-grid`
    `cp -a #{source_root}/app/assets/stylesheets/ronin-grid/_setup.scss #{Rails.root}/#{args.sass_path}/ronin-grid`
  end
end

