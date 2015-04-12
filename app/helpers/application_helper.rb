module ApplicationHelper
  def password_class
    res = 'form-group'
    res << ' has-error has-feedback' if flash[:failed_login]

    res
  end

  def refill_class
    res = 'btn btn-warning'
    res << ' hidden' unless User.current_user.balance == 0

    res
  end
end
