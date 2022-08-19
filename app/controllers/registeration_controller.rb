class RegisterationController < Devise::RegisterationController
    def sign_up_params
        params.require(:user).permit(:name, :usertype, :email, :password, :password_confirmation)
    end
end
