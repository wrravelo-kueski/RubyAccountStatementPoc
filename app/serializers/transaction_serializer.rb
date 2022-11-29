class TransactionSerializer < ActiveModel::Serializer
  attributes :creationDate, :entryDate, :type, :amount, :principalPaid, :interestPaid,
             :interestFromArrearsAmount, :deferredInterestAmount, :feesPaid, :penaltyPaid,
             :taxOnInterestPaid, :taxOnInterestFromArrearsAmount, :taxOnFeesAmount, :taxOnPenaltyAmount,
             :deferredTaxOnInterestAmount, :advancePosition, :arrearsPosition, :expectedPrincipalRedraw,
             :balance, :redrawBalance, :principalBalance, :userKey, :productTypeKey, :transactionId,
             :organizationCommissionAmount, :fundersInterestAmount, :valueDate, :bookingDate, :encodedKey,
             :customerInformation, :comment, :parentAccountKey, :branchKey, :details

  def transactionId
    transaction.id
  end

  def type
    transaction.transaction_type
  end

  def userKey
    transaction.user_id
  end

  def productTypeKey
    transaction.finance_product_id
  end

  def encodedKey
    Random.hex()
  end

  def customerInformation
    []
  end

  def comment
    {
      "source_transaction_id": transaction.id
    }.to_json.to_s
  end

  def parentAccountKey
    Random.hex()
  end

  def branchKey
    Random.hex()
  end

  def details
    {
      "encodedKey": Random.hex(),
      "transactionChannelKey": Random.hex(),
      "internalTransfer": false,
      "transactionChannel": {
        "encodedKey": Random.hex(),
        "id": "CONEKTA_DIRECT_DEBIT",
        "name": "Conekta Direct Debit",
        "createdByUserKey": Random.hex(),
        "creationDate": Time.now,
        "index": Random.rand(1000),
        "activated": true,
        "savingsConstraintsUsage": "UNCONSTRAINED_USAGE",
        "savingsConstraints": {
          "encodedKey": Random.hex(),
          "filterConstraints": []
        },
        "usageRights": {
          "encodedKey": Random.hex(),
          "isAccessibleByAllUsers": true,
          "roles": []
        }
      }
    }
  end

  private

  def transaction
    object
  end
end
