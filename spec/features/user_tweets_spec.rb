require 'rails_helper'

feature 'user tweets' do
  before do
    stub_omniauth
  end

  scenario 'after log in with valid credentials' do
    VCR.use_cassette('user_posts_a_tweet') do
      visit root_path
      click_link 'Log In'

      expect(current_path).to eq('/dashboard')

      fill_in 'tweet', with: 'Testing, 1, 2.'
      click_button 'Tweet'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Testing, 1, 2.')
    end
  end
end
