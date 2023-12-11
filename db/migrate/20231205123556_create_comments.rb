class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :counter_like, null:false, default: 0
      t.text :comment, null:false, limit: 1000
      t.integer :book_id, null:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
