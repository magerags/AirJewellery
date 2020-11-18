class ApplicationController < ActionController::Base
  def after_sign_in_path_for(ressource)
   jewelleries_path
end
end
