class AddJewelleryToLoans < ActiveRecord::Migration[6.0]
  def change
    add_reference :loans, :jewellery, null: false, foreign_key: true
  end
end
