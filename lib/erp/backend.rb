require 'devise'
require 'pundit'
require 'carrierwave' # require gem in scope Erp module
require "erp/backend/version"
require "erp/backend/engine"

module Erp
  module Backend
    def self.available?(engine_name)
      Object.const_defined?("Erp::#{engine_name.to_s.camelize}") # Check engine in available?
    end
  end
end
