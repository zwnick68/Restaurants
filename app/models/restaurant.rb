class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def Restaurant.fanciest
        self.order("price DESC").limit(1)
    end

    def all_reviews
        arr = []
        self.reviews.map do |e|
             arr << e.full_review
        end
        return arr
    end
end