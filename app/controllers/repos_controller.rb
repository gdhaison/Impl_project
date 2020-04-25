class ReposController < ApplicationController
  def show
    url = params[:star_url]
    @total = params[:star].to_i
    params[:page].nil? ? params[:page] = "1" : params[:page]
    response = HTTParty.get(url + "?page=" + params[:page].to_s + "&per_page=" + Settings.per_page.to_s)
    @record_count = params[:page].to_i * Settings.per_page
    @users = response.parsed_response
  end
end
