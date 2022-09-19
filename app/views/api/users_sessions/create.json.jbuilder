if @success
  json.success @success

  json.user do
    json.id @user.id

    json.created_at @user.created_at

    json.updated_at @user.updated_at
  end

  json.access_token do
    json.token @access_token.token
  end

else
  json.success @success
  json.error_message @error_message

end
