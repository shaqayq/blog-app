class Post < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' ,  class_name: 'User'
    has_many :comments , foreign_key: 'post_id'
    has_many :likes
    after_save :user_counters

    
   def user_counters
    user.increment!(:post_counter)
   end 
    
    def self.five_most_recent_post
        order(created_at: :asc).limit(5)
    end
end
