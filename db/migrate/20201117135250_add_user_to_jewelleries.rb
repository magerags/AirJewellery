class AddUserToJewelleries < ActiveRecord::Migration[6.0]
  def change
    add_reference :jewelleries, :user, null: false, foreign_key: true
  end
end
