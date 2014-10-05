module ApplicationHelper
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def bootstrap_alert(key)
    if key == "error"
      "danger"
    else
      key
    end
  end

end
