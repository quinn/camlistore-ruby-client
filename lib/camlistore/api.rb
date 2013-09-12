module Camlistore

  module API
    extend ActiveSupport::Concern

    def connection
      @connection ||= Faraday.new(config.bshost) do |conn|
        conn.response :mashify
        conn.response :json, content_type: 'text/javascript'
        conn.adapter Faraday.default_adapter
      end
    end

    def api_call url, params = {}
      response = connection.get(url, params)

      data = response.body

      # Camlistore doesn't seem to give errors?
      # error_message = data.error_message
      # raise ArgumentError, error_message if error_message

      if block_given?
        yield data
      else
        data
      end
    end

    module ClassMethods
      def api_method key, url, &block
        define_method key do |params = {}|
          api_call url, params, &block
        end
      end
    end
  end

end
