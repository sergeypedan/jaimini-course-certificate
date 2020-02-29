lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "jaimini/course_certificates/version"

Gem::Specification.new do |spec|
  spec.name          = "jaimini-course_certificates"
  spec.version       = Jaimini::CourseCertificates::VERSION
  spec.authors       = ["Sergey Pedan"]
  spec.email         = ["sergey.pedan@gmail.com"]

  spec.summary       = "Creates certificate PDFs"
  spec.description   = "Creates certificate PDFs"
  spec.homepage      = "https://gitlab.com/sergey_pedan/jaimini-calendar-builder"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.com/sergey_pedan/jaimini-calendar-builder"
  spec.metadata["changelog_uri"] = "https://gitlab.com/sergey_pedan/jaimini-calendar-builder/Changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-schema"
  spec.add_dependency "prawn"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
