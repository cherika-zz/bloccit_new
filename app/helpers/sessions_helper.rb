module SessionsHelper
  def create_session(user)
    # creating a sessions hash; user_id is the hash key
    session[:user_id] = user.id
  end

  def destroy_session(user)
    session[:user_id] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
