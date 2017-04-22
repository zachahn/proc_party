# coding: utf-8

Gem::Specification.new do |spec|
  spec.name = "proc_party"
  spec.version = "0.2.0"
  spec.authors = ["Zach Ahn"]
  spec.email = ["engineering@zachahn.com"]

  spec.homepage = "https://github.com/zachahn/proc_party"
  spec.summary = "Procs everywhere"
  spec.description =
    "ProcParty makes classes with a #call method act like procs. " \
    "Documentation for this release is located in " \
    "#{spec.homepage}/blob/v#{spec.version}/README.md"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "yard"
end
