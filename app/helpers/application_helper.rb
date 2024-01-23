module ApplicationHelper
  def environment_specific_url
    if Rails.env.production?
      "https://bookiss.onrender.com/user_sessions/callback"
    else
      "http://localhost:8000/user_sessions/callback"
    end
  end
end
