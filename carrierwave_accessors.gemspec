# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave_accessors/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave_accessors"
  spec.version       = CarrierwaveAccessors::VERSION
  spec.authors       = ["Grigory Antonov"]
  spec.email         = ["antonovga@gmail.com"]
  spec.summary       = %q{carrierwave plugin to mount on postgresql json&hstore fields}
  spec.description   = %q{carrierwave plugin to mount on postgresql json&hstore fields accessible through ar store_accessor method}
  spec.homepage      = "https://bitbucket.org/antonovga/carrierwave_accessors"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "carrierwave"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
