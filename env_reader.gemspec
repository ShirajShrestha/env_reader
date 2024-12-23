# frozen_string_literal: true

require_relative "lib/env_reader/version"

Gem::Specification.new do |spec|
  spec.name          = "env_reader"
  spec.version       = EnvReader::VERSION
  spec.authors       = ["ShirajShrestha"]
  spec.email         = ["shresthashiraj333@gmail.com"]

  spec.summary       = "Reads the keys of the .env file"
  spec.description   = "Reads all the keys in the .env file"
  spec.homepage      = "https://github.com/ShirajShrestha/env_reader"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ShirajShrestha/env_reader"
  spec.metadata["changelog_uri"] = "https://github.com/ShirajShrestha/env_reader"
  spec.license = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end

  # Ensure that executables are in the exe/ directory
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Add the executable files to the gemspec
  spec.files += Dir["exe/*"]  # Make sure executable scripts are included
end
