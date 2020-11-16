class AddUserToJewelleries < ActiveRecord::Migration[6.0]
  def change
    add_reference :jewelleries, :jewellery, null: false, foreign_key: true
  end
end
