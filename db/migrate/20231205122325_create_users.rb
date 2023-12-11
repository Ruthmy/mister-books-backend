class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null:false, limit: 50
      t.string :username, null:false, limit: 50
      t.string :avatar
      t.string :bio, limit: 160
      t.string :country, limit: 100

      t.timestamps
    end
  end
end
