class CreateFinanceProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :finance_products do |t|

      t.timestamps
    end
  end
end
