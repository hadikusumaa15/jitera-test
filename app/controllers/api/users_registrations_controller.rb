class Api::UsersRegistrationsController < Api::BaseController
  def create
    @user = User.new(email: params[:email], password: params[:password])
    @success = @user.save
    @error_message = parse_error_message(@user)
  end
end
