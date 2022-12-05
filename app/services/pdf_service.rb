class PdfService < ApplicationService
  attr_accessor :finance_product, :ini_date, :end_date, :transactions

  def initialize(finance_product, ini_date = nil, end_date = nil)
    @finance_product = finance_product
    @ini_date = ini_date
    @end_date = end_date
    @transactions = find_transactions
  end

  def call
    result = ActionController::Base.new.render_to_string(
      template: 'finance_products/transactions.html.erb',
      assigns: {
        :finance_product => @finance_product,
        :transactions => @transactions
      }
    )
    pdf = WickedPdf.new.pdf_from_string(result)
    base_path = "#{Rails.root}/pdfs"
    save_path = base_path + "/#{finance_product.id}.pdf"
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  private

  def find_transactions
    result_transactions = @finance_product.transactions
    unless @ini_date.blank?
      result_transactions = result_transactions.where(
        '"creationDate" >= ?', @ini_date
      )
    end

    unless @end_date.blank?
      result_transactions = result_transactions.where(
        '"creationDate" <= ?', @end_date
      )
    end

    result_transactions
  end
end