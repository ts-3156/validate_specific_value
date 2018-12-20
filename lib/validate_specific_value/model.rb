require "active_support/concern"

module ValidateSpecificValue
  module Model
    extend ActiveSupport::Concern

    class_methods do
      def validates_specific(column)
        column = column.to_sym
        method_name = "valid_#{column}?"

        # def valid_[attribute]? ... end
        unless method_defined?(method_name)
          define_method method_name do
            errors.clear
            self.class.validators_on(column).each do |validator|
              validator.validate_each(self, column, self[column])
            end
            errors.empty?
          end
        end

        # def self.valid_[attribute]?(value) ... end
        define_singleton_method method_name do |value, errors = {}|
          instance = self.new(column => value)
          instance.send(method_name)
          errors[column] = instance.errors[column]
          errors[column].empty?
        end
      end
    end
  end
end
