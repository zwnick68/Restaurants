class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews
    def full_name
        "#{first_name} #{last_name}"
    end
    def favorite_restaurant
        self.restaurants.order("star_rating DESC").limit(1)
    end
    def add_review(restaurant, rating)
        Review.create(star_rating: rating, customer_id: self.id, restaurant_id: restaurant)
    end
    def delete_reviews(restaurant)
        self.reviews.where(restaurant_id: restaurant).destroy_all
        
    end

end
