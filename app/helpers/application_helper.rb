module ApplicationHelper
  def full_title(page_title = '')
    base_title = "SR Share"
    if page_title.blank?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def current_user?(user)
    user == current_user
  end
end
