class Api::UsersVerifyResetPasswordRequestsController < Api::BaseController
  before_action :set_default_response, only: [:create]

  def create
    user = User.find_by(reset_password_token: params[:reset_token])

    if user.present?
      if params[:password] == params[:password_confirmation]
        user.generate_reset_password_token
        @success = user.errors.blank?
        @error_message = parse_error_message(user)
      else
        @error_message = "Password confirmation didn't match!"
      end
    end
  end
end
