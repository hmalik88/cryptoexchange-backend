class UserSerializer < ActiveModel::Serializer
  attributes :id, :address, :balance
  has_many :transfers

end
