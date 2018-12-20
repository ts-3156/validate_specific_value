# validate_specific_value

This is a way to validate single attribute in Rails. :tada:

Sometimes there are validations that are quite expensive (e.g. validations that need to perform database queries). In that case you need to avoid using valid? because it simply does a lot more than you need. [link](https://stackoverflow.com/questions/4804591/rails-activerecord-validate-single-attribute)

## Getting Started

Add this line to your application’s Gemfile:

```ruby
gem 'validate_specific_value'
```

Add a validation rule to your model.

```ruby
validates :name, uniqueness: true
```

And use:

```ruby
class User < ApplicationRecord
  validates_specific :name
end
```

## Accessor Methods

Instance context:

```ruby
user = User.new(name: 'duplicate_name')
user.valid_name?
# => false

user.errors[:name]
# => ["has already been taken"]

```

Class context:

```ruby
User.valid_name?('duplicate_name')
# => false
```

## Implementation

The implementation is quite simple.

```ruby
class User < ApplicationRecord
  def valid_name?
    errors.clear
    self.class.validators_on(:name).each do |validator|
      validator.validate_each(self, :name, self[:name])
    end
    errors.empty?
  end
end
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ts-3156/validate_specific_value/issues)
- Fix bugs and [submit pull requests](https://github.com/ts-3156/validate_specific_value/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
