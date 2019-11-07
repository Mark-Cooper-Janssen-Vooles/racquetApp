class RegistrationsController < Devise::RegistrationsController

  private
  def after_sign_up_path_for(resource)
    #after user signed up, redirect to new user details create form.
    new_user_detail_path
  end  

end