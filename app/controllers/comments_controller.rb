class CommentsController < ApplicationController
    def new
        @comment=Comment.new
        @user = current_user
    end

    def create
        @post = Post.find(params[:post_id] || params[:id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post = @post

        respond_to do |format|
            if @comment.save!
              format.html do
                redirect_to user_post_url(current_user, @post), notice: 'Comment was successfully created.'
              end
            else
              format.html { render :new, status: :unprocessable_entity }
            end
          end


      
    end

    def comment_params
        params.require(:comment).permit(:text)
    end

    def destroy
      @post = Comment.find_by_id(params[:id])
      @post.destroy
      @post.update_user_posts_comment_counter
      redirect_to user_posts_path
      
  end
end
