class User < ApplicationRecord
    has_many :posts , foreign_key: 'user_id'
    has_many :likes 
    has_many :comments 

    scope :recent_post, -> {order(created_at: :asc).limit(3)}
end
