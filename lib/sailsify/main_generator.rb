require 'fileutils'

module Sailsify
  class MainGenerator
    def execute
      create_dirs
      create_models
      create_controllers
    end

    private

    def create_dirs
      FileUtils.mkdir_p(dirs)
    end

    def dirs
      [
        sub_dir('models'),
        sub_dir('controllers')
      ]
    end

    def sub_dir(dir_path)
      Sailsify.destination_dir.join(dir_path)
    end

    def create_models
      Generators::Model.create(app_models)
    end

    def create_controllers
      Generators::Controller.create(app_models)
    end

    def app_models
      @app_models ||= ActiveRecord::Base.descendants
    end
  end
end
