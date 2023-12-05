class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :book_id, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
