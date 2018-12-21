
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "validate_specific_value/version"

Gem::Specification.new do |spec|
  spec.name          = "validate_specific_value"
  spec.version       = ValidateSpecificValue::VERSION
  spec.authors       = ["ts-3156"]
  spec.email         = ["ts_3156@yahoo.co.jp"]

  spec.summary       = %q{Validate specific value for Rails}
  spec.homepage      = "https://github.com/ts-3156/validate_specific_value"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/ts-3156/validate_specific_value"
    spec.metadata["changelog_uri"] = "https://github.com/ts-3156/validate_specific_value"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_rubygems_version = ">= 1.3.6"
  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "activerecord", [">= 4.2", "< 6.0"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mysql2", "~> 0.5.2"
  spec.add_development_dependency "pg", "~> 1.1.3"
end
