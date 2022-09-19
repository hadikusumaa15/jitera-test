class Api::UsersPasswordsController < Api::BaseController
  before_action :set_default_response, only: [:put_users_passwords]

  def put_users_passwords
    user = User.password_resettable(reset_password_token: params[:reset_password_token])

    if user.present?
      @success = user.update(password: params[:new_password])
      @error_message = parse_error_message(user)
    end
  end
end
