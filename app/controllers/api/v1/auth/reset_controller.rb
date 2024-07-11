class Api::V1::Auth::ResetController < DeviseTokenAuth::PasswordsController
  private

  def resource_params
    params.permit(:password, :password_confirmation, :reset_password_token)
  end
end
