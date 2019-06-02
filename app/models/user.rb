class User < ApplicationRecord
has_many :transfers
validates :address, uniqueness: {case_sensitive: false}


end
