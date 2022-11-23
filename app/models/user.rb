class User < ApplicationRecord
  has_many :transactions
  has_many :finance_products
end
