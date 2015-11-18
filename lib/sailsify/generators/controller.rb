module Sailsify
  module Generators
    class Controller < AbstractGenerator
      private

      def file_name
        "#{model.name}Controller.js"
      end

      def sub_dir
        'controllers'
      end

      def template_path
        File.expand_path('../../templates/controller.js.erb', __FILE__)
      end
    end
  end
end
