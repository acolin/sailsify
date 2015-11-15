module Sailsify
  module Generators
    class BaseGenerator
      attr_reader :model

      def self.create(params)
        if params.kind_of?(Array)
          new_objs = params.map { |o| self.new(o) }
          new_objs.each(&:save)
        else
          new_obj = self.new(params)
          new_obj.save
        end
      end

      def initialize(params={})
        @model = params[:model]
        after_initialize(params)
      end

      def after_initialize(params); end

      def save
        File.write(file_path, file_content)
      end

      private

      def file_path
        base_dir.join(file_name)
      end

      def file_name
        Raise NotImplementedError
      end

      def dir
        Sailsify.destination_dir.join(sub_dir)
      end

      def sub_dir
        Raise NotImplementedError
      end

      def file_content
        view.render(
          file: template_path,
          locals: locals
        )
      end

      def template_path
        Raise NotImplementedError
      end

      def view
        @view ||= ActionView::Base.new
      end

      def locals
        { :@model => model }.merge(custom_locals)
      end

      def custom_locals
        {}
      end

    end
  end
end
