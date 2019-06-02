class TransferSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipient_id, :amount
  belongs_to :user
end
