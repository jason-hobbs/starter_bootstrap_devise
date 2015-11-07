class PasswordsController < Devise::PasswordsController
  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    gflash :success => "Email send for password reset."
    root_path
  end
end
