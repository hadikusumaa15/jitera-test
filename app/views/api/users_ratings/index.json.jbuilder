if @user_ratings.present?
  json.user_ratings @user_ratings do |user_rating|
    json.id user_rating.id
    json.user_id user_rating.user_id
    json.rating_value user_rating.rating_value
    json.created_at user_rating.created_at
    json.updated_at user_rating.updated_at
  end
else
  json.error_message @error_message
end
