require "active_support"
require "validate_specific_value/version"
require "validate_specific_value/model"

ActiveSupport.on_load(:active_record) do
  include(ValidateSpecificValue::Model)
end

module ValidateSpecificValue
  class Error < StandardError; end
  # Your code goes here...
end
