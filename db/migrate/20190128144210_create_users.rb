#if db:migrate is not working run the following commands windowws
# rake db:drop:_unsafe
# rake db:create
# rake db:migrate
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
