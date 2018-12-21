require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"
require "active_record"

Minitest::Test = Minitest::Unit::TestCase unless defined?(Minitest::Test)

# for debugging
ActiveRecord::Base.logger = Logger.new(STDOUT) if ENV["DEBUG"]

# migrations
ActiveRecord::Base.establish_connection(YAML.load_file("test/database.#{ENV['DB']}.yml")["test"])

ActiveRecord::Migration.create_table :users do |t|
  t.string :name
end

class User < ActiveRecord::Base
  validates :name, uniqueness: true
  validates_specific :name
end
