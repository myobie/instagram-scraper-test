require 'uri'
require 'net/http'

require_relative 'response'

module Instagram
  UnsuccessfulRequest = Class.new(StandardError)

  class Client
    def self.base_url
      "https://api.instagram.com/v1/"
    end

    def self.url(path)
      path.gsub!(/^\//, '')
      "#{base_url}/#{path}"
    end

    def initialize(config = {})
      @config        = config.dup
      @client_id     = @config.fetch(:client_id, ENV.fetch("CLIENT_ID"))
      @client_secret = @config.fetch(:client_secret, ENV.fetch("CLIENT_SECRET"))
    end

    def get(path, params = {})
      uri = URI(self.class.url(path))

      params.merge! client_id: @client_id

      uri.query = URI.encode_www_form(params)

      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        Response.new(response)
      else
        raise UnsuccessfulRequest, response.body
      end
    end

    def tag(tag_name)
      get("tags/#{tag_name}/media/recent")
    end
  end
end
