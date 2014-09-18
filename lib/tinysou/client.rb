require 'tinysou/version'

module Tinysou
  # Client for the Tinysou API
  class Client
    attr_accessor :token

    def initialize(token)
      @token = token
      @conn = Faraday.new(url: 'http://api.tinysou.com/v1/') do |faraday|
        faraday.adapter Faraday.default_adapter
      end
      @headers = { 'Content-type' => 'application/json',
                   'Authorization' => "token #{@token}",
                   'User-Agent' => "Tinysou-Ruby/#{Tinysou::VERSION}" }
    end

    def get(path, params = nil)
      request :get, path, params, nil
    end

    def post(path, data = nil)
      request :post, path, nil, data
    end

    def put(path, data = nil)
      request :put, path, nil, data
    end

    def delete(path, params = nil)
      request :delete, path, params, nil
    end

    private

    def request(method, path, params, data)
      res = @conn.run_request(method,
                              path,
                              MultiJson.dump(data),
                              @headers) do |req|
        req.params.update(params) if params
        yield(req) if block_given?
      end
      if res.status == 204
        true
      elsif res.status > 400
        fail "status: #{res.status}, error: #{res.body}"
      else
        MultiJson.load(res.body, symbolize_keys: true)
      end
    end
  end
end
