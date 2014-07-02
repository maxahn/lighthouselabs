class AddReviews < ActiveRecord::Migration
  def change

    create_table :reviews do |t|
      t.text :review
      t.timestamps
    end

    add_reference :reviews, :track
    add_reference :reviews, :user

  end
end
