# Class contains code that will be shared among all the controllers
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include ApplicationHelper
end
