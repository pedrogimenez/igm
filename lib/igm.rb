require "json"
require "nestful"

module IGM
  extend self

  INSTAGRAM_URL = "https://api.instagram.com"

  attr_writer :client_id, :client_secret

  def configure
    yield self
  end

  def authorize_uri(params)
    params[:scope]         = params[:scope].join("+")
    params[:client_id]     = @client_id
    params[:response_type] = "code"

    query_string = params_to_query_string(params)

    "#{INSTAGRAM_URL}/oauth/authorize?#{query_string}"
  end

  def get_access_token(params)
    params[:client_id]     = @client_id
    params[:client_secret] = @client_secret
    params[:grant_type]    = "authorization_code"

    response = Nestful.post("#{INSTAGRAM_URL}/oauth/access_token", params)
    response = parse_response(response)

    response[:access_token]
  end

  def get_user_info(token)
    response = Nestful.get("#{INSTAGRAM_URL}/v1/users/self?access_token=#{token}")

    response = parse_response(response)

    response[:data]
  end

  private

  def params_to_query_string(params)
    params.map { |k,v| "#{k}=#{v}" }.join("&")
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
