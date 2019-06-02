class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def create
    @user = User.find_by(address: user_login_params[:address])
    if @user
      @token = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: @token}, status: :accepted
    else
      render json: {message: 'Invalid address'}, status: :unauthorized
    end
  end

  def show
    if current_user
      render json: {user: current_user}
    else
      render json: {error: "not logged in"}, status: 422
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:address)
  end
end
