class Comment < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' , class_name: 'User'
    belongs_to :post , foreign_key: 'post_id' , class_name: 'Post'
    after_save :post_comment_counter

    def post_comment_counter
        post.increment!(:comments_counter)
    end

    def update_user_posts_comment_counter
        post = Post.find(post_id)
        post.update(comments_counter: post.comments.count)
    end
end
