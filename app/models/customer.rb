class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews #:, syntax, plural

#     Customer#full_name
# returns the full name of the customer, with the 
# first name and the last name concatenated, Western style.
    def full_name
        "#{self.first_name} #{self.last_name}" 
    end

    # Customer#favorite_restaurant
    # returns the restaurant instance // that has the highest star rating from this customer

    def favorite_restaurant
        Restaurant.all.order(:star_rating).first
    end
            #restaurant = Restaurant.first OR.. Restaurant.second OR .. any instance
            #restaurant here as parameter is NOT name of the restaurant 
    # Customer#add_review(restaurant, rating)
    # takes a restaurant (an instance of the Restaurant class) and a rating
    # creates a new review for the restaurant with the given restaurant_id

    def add_review(restaurant, rating)
        Review.create(star_rating: rating, restaurant_id: restaurant.id, customer_id: self.id)
    end


#     Customer#delete_reviews(restaurant)
# takes a restaurant (an instance of the Restaurant class) and
# removes all their reviews for this restaurant
# you will have to delete rows from the reviews table to get this to work!

    def delete_reviews(restaurant)
        Restaurant.find(restaurant.id).reviews.destroy_all
    end



end