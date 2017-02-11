module Helper

  def absolute_path(url)
    ActionController::Base.asset_host + url
  end

end