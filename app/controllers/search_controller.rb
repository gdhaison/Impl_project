class SearchController < ApplicationController
  def index
    if params[:search]
      url = "http://api.github.com/users/" + params[:search]
      @total = HTTParty.get(url).parsed_response["public_repos"]
      params[:page].nil? ? params[:page] = "1" : params[:page]
      response = HTTParty.get(url + "/repos?" + "page=" + params[:page] + "&per_page=" + Settings.per_page.to_s)
      @record_count = params[:page].to_i * Settings.per_page
      @repos = response.parsed_response
    end
  end
end
