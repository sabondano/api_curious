require 'rails_helper'

feature 'user retweets' do
  before do
    stub_omniauth
  end

  scenario 'after log in with valid credentials' do
    VCR.use_cassette('user_retweets') do
      visit root_path
      click_link 'Log In'

      expect(current_path).to eq('/dashboard')
      
      first('.btn-retweet').click

      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('.retweeted-arrows', count: 1)
    end
  end
end
