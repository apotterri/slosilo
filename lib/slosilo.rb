require "slosilo/jwt"
require "slosilo/version"
require "slosilo/keystore"
require "slosilo/symmetric"
require "slosilo/attr_encrypted"
require "slosilo/random"
require "slosilo/errors"

if defined? Sequel
  require 'slosilo/adapters/sequel_adapter'
  Slosilo::adapter = Slosilo::Adapters::SequelAdapter.new
end

# Autoloading in Rails 6 (and maybe other version) means `Rake` will
# be defined when we're loaded by the `rails` command. `Rake::DSL`
# doesn't get defined unless we're actually run by `rake`.
Dir[File.join(File.dirname(__FILE__), 'tasks/*.rake')].each { |ext| load ext } if defined?(Rake::DSL)
