class CreateAttractions < ActiveRecord::Migration
 # (got from db/seed.rb):attraction_keys => ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"],
    create_table :attractions do |t|
      t.string :name
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :tickets
      t.integer :min_height
    end
      
end
