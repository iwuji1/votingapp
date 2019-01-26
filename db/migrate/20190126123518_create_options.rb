class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.integer :votes
      t.integer :candidate_id

      t.timestamps
    end
  end
end
