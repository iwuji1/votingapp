class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    create_table :options do |t|
      t.integer :user_id
      t.integer :ballot_id
      t.string :vote

      t.timestamps
    end
  end
end
