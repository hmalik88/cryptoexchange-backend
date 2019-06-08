class Api::V1::TransfersController < ApplicationController

  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.valid?
      @transfer.save
      if (transfer_params[:user_id] == 1)
        sub_amount = 0
        add_amount = 10
      else
        sub_amount = transfer_params[:amount]
        add_amount = transfer_params[:amount]
      end
      @sender = User.find_by(id: transfer_params[:user_id])
      @recipient = User.find_by(address: transfer_params[:recipient_id])
      @sender.balance -= sub_amount
      @recipient.balance += add_amount
      @sender.save
      @recipient.save
      render json: {transfer: @transfer}, status: :accepted
    else
      render json: {message: 'Invalid transaction'}, status: :unauthorized
    end
  end

  def index
  end

  private

  def transfer_params
    params.require(:transfer).permit(:user_id, :recipient_id, :amount)
  end

end
