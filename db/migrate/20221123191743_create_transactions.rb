class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|

      t.timestamps
      t.string :type
      t.datetime :creationDate
      t.datetime :entryDate
      t.datetime :valueDate
      t.datetime :bookingDate
      t.integer :transactionId
      t.integer :amount
      t.integer :principalPaid
      t.integer :interestPaid
      t.integer :interestFromArrearsAmount
      t.integer :deferredInterestAmount
      t.integer :feesPaid
      t.integer :penaltyPaid
      t.integer :taxOnInterestPaid
      t.integer :taxOnInterestFromArrearsAmount
      t.integer :taxOnFeesAmount
      t.integer :taxOnPenaltyAmount
      t.integer :deferredTaxOnInterestAmount
      t.integer :advancePosition
      t.integer :arrearsPosition
      t.integer :expectedPrincipalRedraw
      t.integer :balance
      t.integer :redrawBalance
      t.integer :principalBalance
      t.integer :interestRate
      t.integer :organizationCommissionAmount
      t.integer :fundersInterestAmount
    end
  end
end
