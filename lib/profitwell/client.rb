Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Profitwell::Client

  attr_reader :auth_token

  def initialize(auth_token=nil)
    @auth_token = auth_token
  end

  def auth_token=(new_token)
    @auth_token = new_token
    reset_connection
  end

  def reset_connection
    @connection = nil
  end

  def connection
    @connection ||= Faraday.new do |req|
      req.adapter :net_http
      req.url_prefix = "https://api.profitwell.com/v1/"

      req.headers['Content-Type'] = "application/json"
      req.headers['User-Agent'] = "Profitwell-Ruby v#{Profitwell::VERSION}"
      req.headers['Accept'] = "*/*"
      req.headers['Authorization'] = "Bearer #{auth_token}"
      req.response :json, content_type: /\bjson$/
    end
  end
end
