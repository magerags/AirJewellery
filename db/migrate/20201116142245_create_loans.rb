class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :jewellery_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
