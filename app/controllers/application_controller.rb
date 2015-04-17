class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    User.current_user = if session[:user_id]
      User.find session[:user_id]
    else
      g = Guest.create
      session[:user_id] = g.id

      g
    end

    I18n.locale = User.current_user.lang || :en
  end
end
