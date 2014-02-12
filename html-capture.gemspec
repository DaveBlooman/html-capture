# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capture/version'

Gem::Specification.new do |spec|
  spec.name          = "html-capture"
  spec.version       = Capture::VERSION
  spec.authors       = ["Dave Blooman"]
  spec.email         = ["david.blooman@gmail.com"]
  spec.summary       = 'capture HTML'
  spec.description   = 'capture HTML'
  spec.homepage      = "http://responsivenews.co.uk"
  spec.license       = "Apache 2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "robotex"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "thor"
end
