class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require :user
    user = User.create(user_params.permit :name, :email, :password, :password_confirmation)

    unless user.persisted?
      render json: { status: 'error', message: user.errors.full_messages.join(', ') }
      return
    end

    render json: { status: 'success' }
  end
end
