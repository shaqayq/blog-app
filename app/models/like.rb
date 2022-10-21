class Like < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id'
    belongs_to :post , foreign_key: 'post_id'
    after_save :post_like_counter

    def post_like_counter
        post.increment!(:likes_counter)
    end
end
