module Sailsify
  module Generators
    autoload :Model, 'sailsify/generators/model'
    autoload :Controller, 'sailsify/generators/controller'
    autoload :AbstractGenerator, 'sailsify/generators/abstract_generator'
  end

  mattr_accessor :destination_dir

  def self.config
    yield self
  end
end

require 'sailsify/main_generator'
require 'sailsify/railtie' if defined?(Rails)
