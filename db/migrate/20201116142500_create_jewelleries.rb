class CreateJewelleries < ActiveRecord::Migration[6.0]
  def change
    create_table :jewelleries do |t|
      t.references :user_id, null: false, foreign_key: true
      t.integer :price
      t.string :name
      t.string :description
      t.string :photo
      t.string :is_rented

      t.timestamps
    end
  end
end
