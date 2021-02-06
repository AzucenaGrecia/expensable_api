class TransactionsController < ApplicationController
  before_action :set_category
  before_action :set_transaction, only: %i[show update destroy]

  # GET /categories/:category_id/transactions
  def index
    @transactions = @category.transactions
    render json: @transactions, status: :ok
  end

  # POST /categories/:category_id/transactions
  def create
    @transaction = @category.transactions.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :bad_request
    end
  end

  # GET /categories/:category_id/transactions/:id
  def show
    render json: @transaction, status: :ok
  end

  # PATCH /categories/:category_id/transactions/:id
  def update
    if @transaction.update(transaction_params)
      render json: @transaction, status: :ok
    else
      render json: @transaction.errors, status: :bad_request
    end
  end

  # DELETE /categories/:category_id/transactions/:id
  def destroy
    @transaction.destroy
    render status: :no_content
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_transaction
    @transaction = @category.transactions.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :note, :date)
  end
end
