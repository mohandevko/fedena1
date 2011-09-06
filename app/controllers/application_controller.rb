class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    if current_user.sign_in_count <= 1 and current_user.email.nil?
      user_path(current_user)
    else
      dashboard_user_path(current_user )
    end
  end
end
