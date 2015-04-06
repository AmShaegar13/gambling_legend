module ApplicationHelper
  def password_class
    res = 'form-group'
    res << ' has-error has-feedback' if flash[:failed_login]

    res
  end
end
