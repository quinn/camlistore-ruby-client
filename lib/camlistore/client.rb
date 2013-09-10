module Camlistore
  Configuration.namespace :camlistore
  Configuration.keys :bshost
  Configuration.env ENV

  class Client
    attr_reader :config
    include API

    def initialize options = {}
      @config = Configuration.new(options, bshost: 'http://localhost:3179/bs/')
      raise ArgumentError, "You must supply blobstore host." unless config.bshost.present?
    end

    api_method :enumerate_blobs, 'camli/enumerate-blobs'

    def each_blob &block
      data = enumerate_blobs
      blobs = data.blobs

      while blobs.any?
        blobs.each &block

        blobs = if data.continueAfter.present?
          data = enumerate_blobs(after: data.continueAfter)
          data.blobs
        else
          []
        end
      end
    end
  end

end
