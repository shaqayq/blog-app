class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
        
    has_many :posts , foreign_key: 'user_id'
    has_many :likes 
    has_many :comments 
  
    validates :name , presence: true
    validates :post_counter , numericality: {only_integer: true, greater_than_or_equal_to: 0}
    after_initialize :init
    before_save :default_photo

    def recent_post
        posts.order(created_at: :desc).limit(3)
    end

    def init
        self.post_counter ||= 0
        true
    end

    def default_photo
        if photo.nil?
            self.photo = 'https://img.myloview.com/posters/social-media-user-icon-default-avatar-profile-image-400-251200036.jpg'
        end
    end
end
