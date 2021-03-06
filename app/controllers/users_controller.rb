class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require :user

    if user_params[:name] =~ /guest/i
      render json: { status: 'error', message: 'Name already taken.' }
      return
    end

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
      render json: { status: 'error', message: '<strong>Not eligible for refill.</strong> You need to be bankrupt.' }
      return
    end

    next_refill = user.last_refill + 1.hour

    if next_refill > Time.now.utc
      render json: { status: 'error', message: '<strong>Not eligible for refill.</strong> You can only refill once per hour. Next refilll available at '+next_refill.to_s }
      return
    end

    user.balance = 1000
    user.last_refill = Time.now.utc
    user.save!

    render json: { status: 'success', balance: user.balance }
  end

  def lang
    user = User.current_user
    user.lang = params.require :lang
    user.save!

    redirect_to :back
  end
end
