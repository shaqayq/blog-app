require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Giso', photo: 'https://randomuser.me/api/portraits/men/65.jpg',
                          bio: 'I am student', post_counter: 5)
      visit root_path
    end
    it 'see the username of all other users.' do
      expect(page).to have_content(@user.name)
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_css('img')
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content(@user.post_counter)
    end

    it 'When I click on a user, I am redirected to that user`s show page' do
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
