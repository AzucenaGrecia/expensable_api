class CategoriesController < ApplicationController
  # GET /categories
  def index
    categories = Category.all
    render json: categories, include: :transactions
  end

  # GET /categories/:id
  def show
    category = Category.find(params[:id])
    render json: category, include: :transactions
  end

  # POST /categories
  def create
    category = Category.new(category_params)
    category.user = current_user
    if category.save
      render json: category, status: :created, include: :transactions
    else
      render json: category.errors, status: :bad_request
    end
  end

  # PATCH /categories/:id
  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category, status: :ok
    else
      render json: category.errors, status: :bad_request
    end
  end

  # DELETE /categories/:id
  def destroy
    category = Category.find(params[:id])
    category.destroy
    render status: :no_content
  end

  def category_params
    params.require(:category).permit(:name, :transaction_type)
  end
end
