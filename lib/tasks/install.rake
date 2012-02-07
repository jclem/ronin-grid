# Rails < 3.1
namespace :'ronin-grid' do
  desc "Install the Ronin files into the Rails assets directory"
  task :install, [:sass_path] do |t, args|
    args.with_defaults :sass_path => 'public/assets/stylesheets'
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    `mkdir -p #{Rails.root}/#{args.sass_path}/ronin-grid`
    `cp -a #{source_root}/app/assets/stylesheets/* #{Rails.root}/#{args.sass_path}/ronin-grid`
    `find #{Rails.root}/#{args.sass_path}/ronin-grid -name "*.css.scss" | while read i; do mv "$i" "${i%.css.scss}.scss"; done`
  end
end
