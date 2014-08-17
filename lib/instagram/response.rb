require 'json'

module Instagram
  class Response
    attr_reader :body
    private :body

    def initialize(response)
      @original_response = response.freeze
      @body = JSON.parse(response.body).freeze
    end

    def to_hash
      body.dup
    end

    def pagination
      body["pagination"]
    end

    def meta
      body["meta"]
    end

    def data
      body["data"]
    end
  end
end
