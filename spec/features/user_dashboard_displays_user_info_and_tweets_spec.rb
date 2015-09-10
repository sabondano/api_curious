require 'rails_helper'

feature "user dashbaord displays user info and tweets" do
  before do
    stub_omniauth
  end

  scenario "after log in with valid credentials" do
    VCR.use_cassette('user_logs_in') do
      visit root_path

      click_link "Log In"

      save_and_open_page
    end
  end
end
