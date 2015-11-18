module Sailsify
  module Generators
    class Model < BaseGenerator
      def table_name
        model.table_name
      end

      def columns
        @columns ||= model.columns.select { |c| foreign_key_columns.exclude?(c.name) }
      end


      def render_associations
        associations.map { |a| render_association(a) }.join(',')
      end

      private

      def custom_locals
        { :@model => self }
      end

      def associations
        @associations ||= model.reflect_on_all_associations
      end

      def supported_associations
        %i(has_one belongs_to has_many)
      end

      def render_association(association)
        case association.macro
        when :belongs_to, :has_one
          render_bt_or_ho(association)
        when :has_many
          render_has_many(association)
        end
      end

      def render_bt_or_ho(association)
        <<-eos
        #{association.name.to_s.camelize(:lower)}: {
            model: '#{association.class_name}',
            columnName: '#{association.foreign_key}'
          }
        eos
      end

      def render_has_many(association)
        <<-eos
        #{association.name.to_s.camelize(:lower)}: {
            collection: '#{association.class_name}',
            via: '#{association.active_record.class_name.camelize(:lower)}'
          }
        eos
      end

      def foreign_key_columns
        @foreign_key_columns ||= model.class.reflect_on_all_associations.select { |a| a.macro == :belongs_to }.map(&:foreign_key).uniq
      end

      def file_name
        "#{model.name}.js"
      end

      def sub_dir
        'models'
      end

      def template_path
        File.expand_path('../../templates/model.js.erb', __FILE__)
      end
    end
  end
end
