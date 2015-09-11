require 'rails_helper'

feature 'user favorites tweet' do
  before do
    stub_omniauth
  end

  scenario 'after log in with valid credentials' do
    VCR.use_cassette('user_favorites_a_tweet') do
      visit root_path
      click_link 'Log In'

      expect(current_path).to eq('/dashboard')
      
      first('.btn-favorite').click

      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('.favorited-star', count: 1)
    end
  end
end
