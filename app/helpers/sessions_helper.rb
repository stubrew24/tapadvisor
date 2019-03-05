module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def is_admin(user)
    session[:admin] = user.id
  end

  def is_taproom(user)
    session[:taproom] = user.taproom_id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def taproom_user
    if (taproom_id = session[:taproom])
     @taproom_user ||= Taproom.find_by(id: session[:taproom])
    end
  end

  def current_user?(user)
   user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.clear
    @current_user = nil
    @taproom_user = nil
  end


  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
