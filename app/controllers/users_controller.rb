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

  def refill
    user = User.current_user

    if user.balance != 0 || user.bets.current.size != 0
      render json: { status: 'error', message: 'Not eligible for refill.' }
      return
    end

    user.balance = 1000
    user.save!

    render json: { status: 'success', balance: user.balance }
  end
end
