class CreateBallots < ActiveRecord::Migration[5.1]
  def change
    create_table :ballots do |t|
      t.string :ballot_name
      t.string :candidates, array: true
      t.string :rank, array: true

      t.timestamps
    end
  end
end
