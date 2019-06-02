class UserSerializer < ActiveModel::Serializer
  attributes :id, :address
  has_many :transfers
end
