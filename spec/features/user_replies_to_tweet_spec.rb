require 'rails_helper'

feature 'user replies to tweet' do
  before do
    stub_omniauth
  end

  scenario 'after log in with valid credentials' do
    VCR.use_cassette('user_replies_to_tweet') do
      visit root_path
      click_link 'Log In'

      expect(current_path).to eq('/dashboard')

      first('.reply-form').find('form').find('textarea').set('Testing, 1, 2.')
      first('.reply-form').find('form').find_button('Tweet').click

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Testing, 1, 2.')
    end
  end
end
