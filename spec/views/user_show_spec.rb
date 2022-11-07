require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'user post index page' do
    before(:each) do
      @user = User.create(name: 'Giso', photo: 'https://randomuser.me/api/portraits/men/65.jpg',
                          bio: 'I am student', post_counter: 5)
      @post = Post.create(user_id: 1, title: 'Giso Post', text: 'This is my first post')

      visit user_path(1)
    end
    it 'see the user`s profile picture.' do
      expect(page).to have_css('img')
    end

    it 'see the user`s username.' do
      expect(page).to have_content(@user.name)
    end

    it 'see the number of posts the user has written.' do
      expect(page).to have_content(@user.post_counter)
    end

    it 'see the post title.' do
      expect(page).to have_content(@post.title)
    end

    it 'see some of the post`s body.' do
      expect(page).to have_content(@post.text)
    end

    it 'see the first comments on a post.' do
      recent_post = @user.recent_post
      expect(page).to have_content(recent_post[0])
      expect(page).to have_content(recent_post[1])
      expect(page).to have_content(recent_post[2])
    end

    it 'redirects to the users posts index page when see all posts is clicked' do
      click_link('See all post')
      expect(page).to have_current_path(user_posts_path(1))
    end
  end
end
