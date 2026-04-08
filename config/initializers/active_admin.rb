ActiveAdmin.setup do |config|
  config.site_title = "Cine Market"

  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user

  config.batch_actions = true

  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  config.localize_format = :long
end