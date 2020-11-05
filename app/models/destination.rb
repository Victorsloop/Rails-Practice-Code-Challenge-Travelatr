class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        self.posts.last(5).map do |post|
            post.title 
        end
    end
    
    def featured_destination
        self.posts.max {|d| d.likes}
    end

  
    def average_age
        total_age = self.bloggers.distinct.sum do |blogger|
            blogger.age 
        end
        average = total_age / self.bloggers.distinct.count
        average 
    end

end
