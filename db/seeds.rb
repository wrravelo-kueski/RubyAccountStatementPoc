# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

FinanceProduct.delete_all
User.delete_all
Transaction.delete_all

1000.times do
  User.create!(
    username: Faker::Name.name
  )
end

User.all.each do |user|
  user.finance_products.create!
end

FinanceProduct.all.each do |product|
  1000.times do
    product.transactions.create!(
      transaction_type: ['DISBURSMENT', 'REPAYMENT'].sample,
      creationDate: Time.now,
      entryDate: Time.now,
      valueDate: Time.now,
      bookingDate: Time.now,
      transactionId: Random.rand(10000),
      amount: Random.rand(1000),
      principalPaid: Random.rand(1000),
      principalPaid: Random.rand(1000),
      interestPaid: Random.rand(1000),
      interestFromArrearsAmount: Random.rand(1000),
      deferredInterestAmount: Random.rand(1000),
      feesPaid: Random.rand(1000),
      penaltyPaid: Random.rand(1000),
      taxOnInterestPaid: Random.rand(1000),
      taxOnInterestFromArrearsAmount: Random.rand(1000),
      taxOnFeesAmount: Random.rand(1000),
      taxOnPenaltyAmount: Random.rand(1000),
      deferredTaxOnInterestAmount: Random.rand(1000),
      advancePosition: Random.rand(1000),
      arrearsPosition: Random.rand(1000),
      expectedPrincipalRedraw: Random.rand(1000),
      balance: Random.rand(1000),
      redrawBalance: Random.rand(1000),
      principalBalance: Random.rand(1000),
      interestRate: Random.rand(1000),
      organizationCommissionAmount: Random.rand(1000),
      fundersInterestAmount: Random.rand(1000),
      user_id: product.user_id
    )
  end
end

#FinanceProduct.all.each do |product|
#  1000.times do
#    product.transactions.create!(
#      transaction_type: ['DISBURSMENT', 'REPAYMENT'].sample,
#      creationDate: Time.now - 2.years,
#      entryDate: Time.now - 2.years,
#      valueDate: Time.now - 2.years,
#      bookingDate: Time.now - 2.years,
#      transactionId: Random.rand(10000),
#      amount: Random.rand(1000),
#      principalPaid: Random.rand(1000),
#      principalPaid: Random.rand(1000),
#      interestPaid: Random.rand(1000),
#      interestFromArrearsAmount: Random.rand(1000),
#      deferredInterestAmount: Random.rand(1000),
#      feesPaid: Random.rand(1000),
#      penaltyPaid: Random.rand(1000),
#      taxOnInterestPaid: Random.rand(1000),
#      taxOnInterestFromArrearsAmount: Random.rand(1000),
#      taxOnFeesAmount: Random.rand(1000),
#      taxOnPenaltyAmount: Random.rand(1000),
#      deferredTaxOnInterestAmount: Random.rand(1000),
#      advancePosition: Random.rand(1000),
#      arrearsPosition: Random.rand(1000),
#      expectedPrincipalRedraw: Random.rand(1000),
#      balance: Random.rand(1000),
#      redrawBalance: Random.rand(1000),
#      principalBalance: Random.rand(1000),
#      interestRate: Random.rand(1000),
#      organizationCommissionAmount: Random.rand(1000),
#      fundersInterestAmount: Random.rand(1000),
#      user_id: product.user_id
#    )
#  end
end