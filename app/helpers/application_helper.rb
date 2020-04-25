module ApplicationHelper
  def last_page current_record, total
    if total > current_record
      current_record
    else
      current_record = total
    end
  end

  def is_last_page? current_record, total
    if total <= current_record
      return false
    else
      return true
    end
  end

  def current_user
    return @current_user = 
      HTTParty.get("https://api.github.com/user?access_token=" + session[:access_token]).parsed_response
  end
end
