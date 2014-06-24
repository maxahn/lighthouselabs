class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.timestamps
    end

    add_reference :votes, :track
    add_reference :votes, :user 
  end
end
