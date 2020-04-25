class SessionsController < ApplicationController
  def new; end

  def create
    data = HTTParty.get("https://github.com/login/oauth/access_token",
                        body: {client_id: Settings.client_id,
                        client_secret: Settings.client_secret,
                        code: params[:code]}).parsed_response
    access_token = get_access_token(data)
    session[:access_token] = access_token
    redirect_to search_path
  end

  def destroy
    session.delete :access_token
    redirect_to root_url
  end

  private

  def get_access_token data
    split1 = data.split("&")
    split2 = split1.first.split("=")
    return result = split2.last
  end
end
