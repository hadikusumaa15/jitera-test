class Api::UsersPasswordsController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter
  def put_users_passwords
    @success = false
    @error_message = 'User not found!'

    user = User.password_resettable(reset_password_token: params[:reset_password_token])

    if user.present?
      @success = user.update(password: params[:new_password])
      @error_message = user.errors.present? ? user.errors.messages.map { |k,v| k.to_s + ' ' +  v.join(' ').to_s }.join(', ') : ''      
    end
  end
end
