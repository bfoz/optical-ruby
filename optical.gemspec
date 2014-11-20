# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name          = "optical"
    spec.version       = '0.1'
    spec.authors       = ["Brandon Fosdick"]
    spec.email         = ["bfoz@bfoz.net"]
    spec.summary       = %q{Optical systems in Ruby}
    spec.description   = %q{The home of all ruby optics}
    spec.homepage      = "http://github.com/bfoz/optical-ruby"
    spec.license       = "BSD"

    spec.files         = `git ls-files -z`.split("\x0")
    spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
    spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    spec.require_paths = ["lib"]

    spec.add_development_dependency "bundler", "~> 1.6"
    spec.add_development_dependency "rake"
end
