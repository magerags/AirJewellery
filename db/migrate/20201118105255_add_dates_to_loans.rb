class AddDatesToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :from, :datetime
    add_column :loans, :to, :datetime
  end
end
