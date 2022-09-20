if @error_object.blank?
  json.user_rating do
    json.id @user_rating.id
    json.user_id @user_rating.user_id
    json.rating_value @user_rating.rating_value
    json.created_at @user_rating.created_at
    json.updated_at @user_rating.updated_at
  end
else
  json.error_object @error_object
end
