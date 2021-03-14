require_relative "lib/erp/backend/version"

Gem::Specification.new do |spec|
  spec.name        = "erp_backend"
  spec.version     = Erp::Backend::VERSION
  spec.authors     = ["Nguyen Quang Huy"]
  spec.email       = ["patrick204nqh@gmail.com"]
  spec.homepage    = "https://patrick204nqh.com"
  spec.summary     = "Summary of Backend."
  spec.description = "Description of Backend."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3"
  spec.add_dependency "devise", "~> 4.7.1"
  spec.add_dependency "pundit", "~> 2.1.0"
end
