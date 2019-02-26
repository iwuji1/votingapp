class AddEmailToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :ballot_id, :integer
  end
end
