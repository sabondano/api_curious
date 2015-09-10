require 'rails_helper'

feature "user dashbaord displays user info and tweets" do
  before do
    stub_omniauth
  end

  scenario "after log in with valid credentials" do
    VCR.use_cassette('user_logs_in_and_sees_feed_and_personal_info') do
      visit root_path

      click_link "Log In"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Sebastian Abondano")
      expect(page).to have_content("@sabondano1")
    end
  end
end
