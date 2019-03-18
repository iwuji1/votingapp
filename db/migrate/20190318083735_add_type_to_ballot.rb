class AddTypeToBallot < ActiveRecord::Migration[5.1]
  def change
    add_column :ballots, :category, :string
  end
end
