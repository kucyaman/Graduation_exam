module ApplicationHelper
  def environment_specific_url
    if Rails.env.production?
      "https://bookiss.onrender.com/user_sessions/callback"
    else
      "http://localhost:8000/user_sessions/callback"
    end
  end

  def image_for_design_type(book)
    case book.design_type
    when "circus"
      "Circus.png"
    when "fairy_tale"
      "Fairy.png"
    else
      "react.gif"
    end
  end
end
