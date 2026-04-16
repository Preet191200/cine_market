class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      address_attributes: [ :street, :city, :postal_code, :province_id ]
    ])
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
