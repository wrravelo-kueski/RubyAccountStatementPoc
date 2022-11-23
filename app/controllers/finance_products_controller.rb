class FinanceProductsController < ApplicationController
  def transactions
    render json: [], status: :ok
  end

  private

  def current_finance_product
    @current_finance_product ||= FinanceProduct.find(params[:id])
  end
end
