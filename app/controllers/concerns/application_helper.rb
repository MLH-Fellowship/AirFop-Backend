# Helper methods for the Application Controller
module ApplicationHelper
  # Returns the current logged in user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returns if the user is logged in or not
  def logged_in?
    !!current_user
  end
end
