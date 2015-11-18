class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    gflash :success => "Check your email to confirm your login."
    root_path
  end

  def after_update_path_for(resource)
    resource.slug = nil
    resource.save!
    gflash :success => "Account updated!"
    root_path
  end
end
