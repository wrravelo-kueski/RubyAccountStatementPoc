class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :finance_product
end
