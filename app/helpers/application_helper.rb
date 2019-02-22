module ApplicationHelper
  def full_title title
    default_title = t "application.title"
    default_title.empty? ? default_title : title + " | " + default_title
  end
end
