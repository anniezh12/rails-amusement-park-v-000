class CreateRides < ActiveRecord::Migration
  #user_id: user.id, attraction_id: attraction.id
   create_table :rides do |t|
     t.integer :user_id
     t.integer :attraction_id
   end
end
