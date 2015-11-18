module Sailsify
  class Railtie < Rails::Railtie
    initializer 'sailsify.load_destination_dir' do |app|
      Sailsify.destination_dir = app.root.join('sailsify')
    end

    rake_tasks do
      load 'tasks/sailsify_tasks.rake'
    end
  end
end
