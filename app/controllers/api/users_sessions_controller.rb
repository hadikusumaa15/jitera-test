class Api::UsersSessionsController < Api::BaseController
  before_action :set_default_response, only: [:create]

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.valid_password?(params[:password])
        @user.create_access_token
        @success = true
        @error_message = parse_error_message(@user)
        @access_token = @user.access_token
      end
    end
  end
end
