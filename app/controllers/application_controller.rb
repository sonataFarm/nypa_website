class ApplicationController < ActionController::Base
  # TODO: protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
end
