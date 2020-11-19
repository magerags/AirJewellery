class RemovePhotoFromJewelleries < ActiveRecord::Migration[6.0]
  def change
    remove_column :jewelleries, :photo, :string
  end
end
