class UsersController < ApplicationController
  # POST /signup
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /profile/:id
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # PATCH /profile
  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profile
  def destroy
    current_user.destroy
    render status: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone)
  end
end
