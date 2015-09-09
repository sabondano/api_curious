require "rails_helper"

feature "user logs in with twitter" do
  before do
    stub_omniauth
  end

  scenario "logging in" do
    visit "/"
    expect(page.status_code).to eq(200)
    click_link "login"
    expect(current_path).to eq("/")
    expect(page).to have_content("Sebastian")
    expect(page).to have_link("logout")
  end
end

def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: 'twitter',
    extra: {
      raw_info: {
        user_id: "1234",
        name: "Sebastian",
        screen_name: "sabondano1",
      }
    },
    credentials: {
      token: "pizza",
      secret: "secretpizza"
    }
  })
end
