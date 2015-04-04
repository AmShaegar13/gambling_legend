module ApplicationHelper
  def current_user
    @current_user ||= if session[:user_id]
      User.find session[:user_id]
    else
      u = User.guest
      u.readonly!
      
      u
    end
  end

  def password_class
    res = 'form-group'
    res << ' has-error has-feedback' if flash[:failed_login]
    
    res
  end
end
