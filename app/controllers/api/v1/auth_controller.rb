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
      @god_transfers = Transfer.all.select{|transfer| transfer.user_id === 1 && transfer.recipient_id === current_user.address }
      @inflows = Transfer.all.select{|transfer| transfer.recipient_id === current_user.address && transfer.user_id != 1}.map{|transfer| {"amount": transfer.amount, "address": User.find(transfer.user_id).address}}
      render json: {user: current_user, transfers: current_user.transfers, god_transfers: @god_transfers, inflows: @inflows}
    else
      render json: {error: "not logged in"}, status: 422
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:address)
  end
end
