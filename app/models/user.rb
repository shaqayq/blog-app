class User < ApplicationRecord
    has_many :posts , foreign_key: 'user_id'
    has_many :likes 
    has_many :comments 
  
    validates :name , presence: true
    validates :post_counter , numericality: {only_integer: true, greater_than_or_equal_to: 0}

    scope :recent_post, -> {order(created_at: :asc).limit(3)}
end
