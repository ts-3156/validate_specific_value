require_relative "test_helper"

class StrEnumTest < Minitest::Test
  def setup
    User.delete_all
  end

  def test_accessor_methods
    user = User.create!(name: 'name')

    assert User.new(name: 'name2').valid_name?
    assert User.valid_name?('name2')

    assert !User.new(name: 'name').valid_name?
    assert !User.valid_name?('name')
  end

  def test_assign_errors
    user = User.create!(name: 'name')

    errors = {}
    assert !User.valid_name?('name', errors)
    assert errors[:name].any?
  end
end
