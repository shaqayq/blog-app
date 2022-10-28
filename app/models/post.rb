class Post < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' ,  class_name: 'User'
    has_many :comments , foreign_key: 'post_id'
    has_many :likes , foreign_key: 'post_id'
    after_save :user_counters

    validates :title , presence: true , length: {maximum: 250}
    # validates :comments_counter, :likes_counter, presence: true,
    #                                            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
   
    
   def user_counters
    user.increment!(:post_counter)
   end 
    
    def five_most_recent_comment
       comments.order(created_at: :asc).limit(5)
    end
end
