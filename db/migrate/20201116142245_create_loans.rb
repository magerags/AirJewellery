class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      # t.references :user, null: false, foreign_key: true
      # t.references :jewellery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
