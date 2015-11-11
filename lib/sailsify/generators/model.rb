module Sailsify
  module Generators
    class Model < BaseGenerator
      private

      def file_name
        "#{model.name}.js"
      end

      def sub_dir
        'models'
      end

      def template_path
        File.expand_path('../templates/model.js.erb', __FILE__)
      end
    end
  end
end
