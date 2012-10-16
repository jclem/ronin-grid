namespace :'ronin-grid' do
  desc "Install the Ronin files into the Rails assets directory"
  task :install, [:sass_path] do |t, args|
    args.with_defaults :sass_path => 'app/assets/stylesheets'
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    `cp -a #{source_root}/app/assets/stylesheets/* #{Rails.root}/#{args.sass_path}`
  end
end
