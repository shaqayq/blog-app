require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'Post show page' do
    before(:each) do
      @user = User.create(name: 'Giso', photo: 'https://randomuser.me/api/portraits/men/65.jpg',
                          bio: 'I am student', post_counter: 5)
      @post = Post.create(user_id: 1, title: 'Giso Post', text: 'This is my first post')

      Comment.create(user_id: 1, post_id: 8, text: 'its test comment')
      Like.create(user_id: 1, post_id: 8)
      visit user_post_path(1, 8)
    end

    it 'see the post`s title.' do
      expect(page).to have_content(@post.text)
    end

    it 'see who wrote the post' do
      expect(page).to have_content(@user.name)
    end

    it 'see some of the post`s body' do
      expect(page).to have_content(@post.text)
    end

    it 'see how many comments a post has' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'see how many likes a post has' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'see how many likes a post has' do
      expect(page).to have_content('its test comment')
    end
  end
end
