class Transfer < ApplicationRecord
validates :recipient_id, presence: true
validates :amount, numericality: { greater_than: 0}
belongs_to :user

end
