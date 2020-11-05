class Destination < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

end
