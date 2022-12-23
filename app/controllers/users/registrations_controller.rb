class Users::RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :usertype)
    end
end
