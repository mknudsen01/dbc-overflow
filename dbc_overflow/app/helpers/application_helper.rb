module ApplicationHelper


  def logged_in?(session)
    !!session[:id]
  end

end
