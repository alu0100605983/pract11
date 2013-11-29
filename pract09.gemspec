lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pract09/version'

Gem::Specification.new do |spec|
  spec.name          = "pract09"
  spec.version       = Pract09::VERSION
  spec.authors       = ["Marias Rojas","Guillermo Rivero"]
  spec.email         = ["alu0100605983@ull.edu.es","alu0100702149@ull.edu.es"]
  spec.description   = %q{Gema para gestionar distintos tipos de matrices}
  spec.summary       = %q{EL programa funciona con matrices densas y dispersas}
  spec.homepage      = "https://github.com/alu0100605983/pract09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
