class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # POST /signup
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { id: @user.id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, phone: @user.phone, token: @user.token },
             status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # GET /profile
  def show
    render json: { id: current_user.id, email: current_user.email, first_name: current_user.first_name, last_name: current_user.last_name, phone: current_user.phone, token: current_user.token }
  end

  # PATCH /profile
  def update
    if current_user.update(user_params)
      render json: {  id: current_user.id, email: current_user.email, first_name: current_user.first_name,
                      last_name: current_user.last_name, phone: current_user.phone, token: current_user.token }
    else
      render json: current_user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /profile
  def destroy
    current_user.destroy
    render status: :no_content
  end

  private

  def user_params
    params.permit(:email, :password, :first_name, :last_name, :phone)
  end
end
