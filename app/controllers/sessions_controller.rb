class SessionsController < ApplicationController
  def create
    name_or_email = params[:name_or_email]
    password = params[:password]
    user = User.find_by('? IN (login, email)', name_or_email.downcase)
        .try(:authenticate, password)

    if user
      # protect from session fixation
      reset_session
      session[:user_id] = user.id
    else
      flash[:failed_login] = name_or_email
    end

    redirect_to :back
  end

  def destroy
    reset_session
    redirect_to :root
  end

  def lang
    session[:lang] = params.require :lang
    redirect_to :back
  end
end
