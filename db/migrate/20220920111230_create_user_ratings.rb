class CreateUserRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ratings do |t|
      t.integer :rating_value, null: false
      t.timestamps
    end

    add_reference :user_ratings, :user, foreign_key: true
    add_reference :user_ratings, :recipe, foreign_key: true
  end
end
