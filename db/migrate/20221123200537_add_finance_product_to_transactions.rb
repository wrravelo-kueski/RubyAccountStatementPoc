class AddFinanceProductToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :finance_product_id, :integer
    add_index  :transactions, :finance_product_id
  end
end
