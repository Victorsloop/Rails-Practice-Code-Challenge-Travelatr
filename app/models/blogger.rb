class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness:true 
    validates :age , numericality:{greater_than:0}
    validates :bio, length:{minimum:30}

    def total_likes
        total = self.posts.map do |post|
            post.likes
        end
        total.sum
    end

    def featured_post
        feature = self.posts.max_by(&:likes)
    end
end
