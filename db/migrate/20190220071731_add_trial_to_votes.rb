class AddTrialToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :trial, :integer, array: true
  end
end
