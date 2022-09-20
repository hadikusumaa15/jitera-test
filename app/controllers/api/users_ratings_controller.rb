class Api::UsersRatingsController < Api::BaseController
  before_action :doorkeeper_authorize!, only: %w[index show update destroy]
  before_action :current_user_authenticate, only: %w[index show update destroy]

  def destroy
    @user_rating = UserRating.find_by(id: params[:id], user: current_user)
    @error_message = 'failed to delete record!' unless @user_rating&.destroy
  end

  def update
    @user_rating = UserRating.find_by(id: params[:id])
    @error_object = @user_rating.errors.messages unless @user_rating.update(rating_value: params[:rating_value])
  end

  def show
    @user_rating = UserRating.find_by(id: params[:id])
    @error_message = true if @user_rating.blank?
  end

  def create
    @user_rating = UserRating.new(
      user: current_user,
      recipe_id: params[:recipe_id],
      rating_value: params[:rating_value]
    )

    @error_object = parse_error_message(@user_rating) unless @user_rating.save
  end

  def index
    @user_ratings = UserRating.where(user: current_user)
  end
end
