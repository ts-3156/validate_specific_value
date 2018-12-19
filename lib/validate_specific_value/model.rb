require "active_support/concern"

module ValidateSpecificValue
  module Model
    extend ActiveSupport::Concern

    class_methods do
      def validates_specific(column)
        column = column.to_sym
        method_name = "valid_#{column}?"

        unless method_defined?(method_name)
          define_method method_name do
            errors.clear
            self.class.validators_on(column).each do |validator|
              validator.validate_each(self, column, self[column])
            end
            errors.empty?
          end
        end

        define_singleton_method method_name do |value|
          instance = self.new
          validators_on(column).each do |validator|
            validator.validate_each(instance, column, value)
          end
          instance.errors[column].empty?
        end
      end
    end
  end
end
