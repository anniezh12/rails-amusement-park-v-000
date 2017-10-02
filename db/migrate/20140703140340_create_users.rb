class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  #:user_keys(got from db/seed.rb) => ["name", "nausea", "happiness", "tickets", "height", "password"],
   create_table :users do |t|
     t.string :name
     t.integer :nausea
     t.integer :happiness
     t.integer :tickets
     t.integer :height
     t.string :password_digest
   end
end
