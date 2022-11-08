require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'Post index page' do
    before(:each) do
      @user = User.create(name: 'Giso', photo: 'https://randomuser.me/api/portraits/men/65.jpg',
                          bio: 'I am student', post_counter: 5)
      @post = Post.create(user_id: 1, title: 'Giso Post', text: 'This is my first post')

      visit user_posts_path(1)
    end

    it ' see the user`s profile picture.' do
      expect(page).to have_css('img')
    end

    it 'see the user`s username.' do
      expect(page).to have_content(@user.name)
    end

    it 'see the number of posts the user has written.' do
      expect(page).to have_content(@user.post_counter)
    end

    it 'see some of the post`s body' do
      expect(page).to have_content(@post.text)
    end

    it 'see the first comments on a post' do
      first_post = @post.five_most_recent_comment
      expect(page).to have_content(first_post[0])
      expect(page).to have_content(first_post[1])
      expect(page).to have_content(first_post[2])
      expect(page).to have_content(first_post[3])
      expect(page).to have_content(first_post[4])
    end

    it 'see how many comments a post has' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'see how many likes a post has' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'When I click on a post, it redirects me to that post`s show page' do
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(1, 8))
    end
  end
end
