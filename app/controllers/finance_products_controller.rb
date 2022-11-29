class FinanceProductsController < ApplicationController
  def transactions
    render json: filter_transactions_by_date(
      current_finance_product.transactions
    ), status: :ok
  end

  private

  def filter_transactions_by_date(transactions)
    result_transactions = transactions
    unless params[:ini_date].blank?
      result_transactions = result_transactions.where(
        '"creationDate" >= ?',  params[:ini_date]
      )
    end

    unless params[:end_date].blank?
      result_transactions = result_transactions.where(
        '"creationDate" <= ?',  params[:end_date]
      )
    end

    result_transactions
  end

  def current_finance_product
    @current_finance_product ||= FinanceProduct.find(params[:id])
  end
end
