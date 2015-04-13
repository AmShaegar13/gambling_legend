module ApplicationHelper
  def password_class
    res = 'form-group'
    res << ' has-error has-feedback' if flash[:failed_login]

    res
  end

  def refill_class
    res = 'btn btn-warning'

    if User.current_user.balance != 0 || User.current_user.bets.current.size != 0
      res << ' hidden'
    end

    res
  end
end
