class Admins::SessionsController < Devise::SessionsController

  # From Devise for AJAX Authenticate
  def new
    respond_to do |format|
      format.js
    end
  end
  
  # Redirect after sign in
  def after_sign_in_path_for(resource_or_scope)
    requests_path(current_user)
  end

end