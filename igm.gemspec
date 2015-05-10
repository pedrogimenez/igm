Gem::Specification.new do |spec|
  spec.name                   = "igm"
  spec.version                = "1.0.0"
  spec.date                   = "2015-05-10"
  spec.summary                = "Interacts with Instagram's API."
  spec.description            = "Interacts with Instagram's API."
  spec.authors                = ["Pedro Gimenez"]
  spec.email                  = ["pedro@chicisimo.com"]
  spec.files                  = Dir["lib/**/*.rb"]
  spec.homepage               = "http://github.com/pedrogimenez/igm"
  spec.extra_rdoc_files       = ["README.md"]
  spec.required_ruby_version  = ">= 2.1.0"
  spec.licenses               = ["MIT"]

  spec.add_runtime_dependency     "nestful"

  spec.add_development_dependency "rspec", "~> 3.0"
end
