class AddTotalPriceToLoan < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :total_price, :float
  end
end
