class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    User.current_user = if session[:user_id]
      User.find session[:user_id]
    else
      User.guest session
    end

    I18n.locale = session[:lang] || :en
  end

  def index
  end
end
