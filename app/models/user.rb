class User < ApplicationRecord
validates :address, uniqueness: {case_sensitive: false}


end
