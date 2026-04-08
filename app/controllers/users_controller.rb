class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @address = current_user.address || Address.new
    @provinces = Province.order(:name)
  end

  def update_address
    @address = current_user.address || current_user.build_address
    @address.street      = params[:street]
    @address.city        = params[:city]
    @address.postal_code = params[:postal_code]
    @address.province_id = params[:province_id]

    if @address.save
      redirect_to profile_path, notice: "Address updated successfully!"
    else
      redirect_to profile_path, alert: "Could not update address."
    end
  end
end
