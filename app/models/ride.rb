class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
  	user = User.find(self.user_id)
  	attraction = Attraction.find(self.attraction_id)
  	error_message = "Sorry. "
  	if user.tickets < attraction.tickets
  		error_message += "You do not have enough tickets to ride the #{attraction.name}. " 	
  	end
  	if user.height < attraction.min_height
  		error_message += "You are not tall enough to ride the #{attraction.name}."
  	end

  	if error_message != "Sorry. "
  		error_message.strip
  	else
  		user.tickets -= attraction.tickets
  		user.nausea += attraction.nausea_rating
  		user.happiness += attraction.happiness_rating
  		user.save
  	end
  end
end



  # create_table "attractions", force: :cascade do |t|
  #   t.string  "name"
  #   t.integer "tickets"
  #   t.integer "nausea_rating"
  #   t.integer "happiness_rating"
  #   t.integer "min_height"
  # end

  # create_table "rides", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.integer "attraction_id"
  # end

  # create_table "users", force: :cascade do |t|
  #   t.string  "name"
  #   t.string  "password_digest"
  #   t.integer "nausea"
  #   t.integer "happiness"
  #   t.integer "tickets"
  #   t.integer "height"
  #   t.boolean "admin",           default: false
  # end