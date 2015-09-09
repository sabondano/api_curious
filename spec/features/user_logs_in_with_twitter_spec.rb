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

  scenario "logging in and logging out" do
    visit "/"
    expect(page.status_code).to eq(200)
    click_link "login"
    expect(current_path).to eq("/")
    expect(page).to have_content("Sebastian")
    expect(page).to have_link("logout")
    click_link "logout"
    expect(current_path).to eq("/")
    expect(page).to_not have_content("Sebastian")
    expect(page).to have_link("login")
  end
end
