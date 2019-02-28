module ApplicationHelper
  def full_title title
    default_title = t "application.title"
    default_title.empty? ? default_title : title + " | " + default_title
  end

  def get_link_image value_url
    url = "https://drive.google.com/uc?export=view&id=#{value_url}"
  end

  def get_year value
    return Time.current.year - value.to_i
  end
end
