# Class manages the session for a user
class SessionsController < ApplicationController

  # Creates a new session
  def create
    user = User.find_by(email: params[:email].downcase) # TODO may need to rethink this
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
    else
      print 'Error' # TODO send some sort of error
    end
  end

  # Ends the current session
  def destroy
    session[:user_id] = nil
  end
end
