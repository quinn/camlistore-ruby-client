require 'net/http'
require 'faraday'
require 'faraday_middleware'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/string/inflections'
require 'active_support/concern'
require 'digest/sha1'
require 'json'

module Camlistore
  autoload :Configuration, 'camlistore/configuration'
  autoload :API,           'camlistore/api'
  autoload :Client,        'camlistore/client'

  def self.new *args
    Client.new *args
  end
end
