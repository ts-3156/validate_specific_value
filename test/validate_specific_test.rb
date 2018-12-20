require_relative "test_helper"

class ValidateSpecificValueTest < Minitest::Test
  def setup
    User.delete_all
  end

  def test_instance_methods
    User.create!(name: 'name')

    assert User.new(name: 'name2').valid_name?
    assert !User.new(name: 'name').valid_name?
  end

  def test_class_methods
    User.create!(name: 'name')

    assert User.valid_name?('name2')
    assert !User.valid_name?('name')
  end

  def test_assign_errors
    User.create!(name: 'name')

    errors = {}
    assert !User.valid_name?('name', errors)
    assert errors[:name].any?
  end
end
