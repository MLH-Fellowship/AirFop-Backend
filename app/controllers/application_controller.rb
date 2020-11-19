class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  private

  # Returns the current user
  def current_user
    @current_user = User.find_by_authentication_token! params[:authentication_token]
  end

  # Returns if the current user is logged in or not
  def logged_in?
    !!current_user
  end
end
