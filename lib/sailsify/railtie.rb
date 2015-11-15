module Sailsify
  class Railtie < Rails::Railtie
    initializer 'sailsify.load_destination_dir' do |app|
      Sailsify.destination_dir = app.root.join('sailsify')
    end

    #initializer 'sailsify.load_descentands' do |app|
      #app.eager_load!
    #end

    rake_tasks do
      load 'tasks/sailsify_tasks.rake'
    end
  end
end
