class User < ActiveRecord::Base 
    has_one :collection
    has_many :games
end