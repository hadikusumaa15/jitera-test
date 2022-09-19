class Api::UsersResetPasswordRequestsController < Api::BaseController
  before_action :set_default_response, only: [:create]

  def create
    user = User.find_by(email: params[:email])

    if user.present?
      user.generate_reset_password_token
      @success = user.errors.blank?
      @error_message = parse_error_message(user)
    end
  end
end
