class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

    def create
      @user = User.create(user_params)
      if @user.valid?
        render json: {user: UserSerializer.new(@user)}, status: :created
      else
        render json: {error: 'failed to create user', errors: @user.errors}, status: :not_acceptable
      end
    end

    def index
      render json: User.all
    end

    private

    def user_params
      params.require(:user).permit(:address, :balance)
    end
end
