class PostsController < ApplicationController
    def index
        @user=User.find(params[:user_id])

        @post= @user.posts
        @post=Post.includes(:user)
       
    end

    def show
        @user=User.find(params[:user_id])
        @post=Post.find(params[:id])
       
    end


    def new
        @post = Post.new
        @user=current_user
    end

    def create
        @post=Post.new(post_params)
        @post.user_id = current_user.id

        respond_to do |format|
            if @post.save
              format.html { redirect_to user_post_url(current_user, @post), notice: 'Post was successfully created.' }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
          end
        
    end

    def post_params
        params.require(:post).permit(:title , :text , :comments_counter , :likes_counter)
    end
end
