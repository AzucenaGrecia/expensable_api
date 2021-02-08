class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  # POST	/login
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      user.regenerate_token
      render json: { id: user.id, email: user.email, first_name: user.first_name,
                     last_name: user.last_name, phone: user.phone, token: user.token }
    else
      respond_unauthorized('Incorrect email or password')
    end
  end

  # DELETE /logout
  def destroy
    current_user.invalidate_token
    head :no_content
  end
end
