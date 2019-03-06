module ApplicationHelper
  def full_title title
    default_title = t "application.title"
    default_title.empty? ? default_title : title + " | " + default_title
  end

  def get_year value
    return Time.current.year - value.to_i
  end

  def watch_movie value_url
    Settings.watch_movie.url + value_url
  end

  def get_key_url_movie id
    Episode.find_by(id: id).url.split(Settings.watch_movie.split_share).last
  end
end
