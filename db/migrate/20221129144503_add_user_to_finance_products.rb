class AddUserToFinanceProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :finance_products, :user_id, :integer
    add_index  :finance_products, :user_id
  end
end
