require "rails_helper"

feature "user logs in with twitter" do
  before do
    stub_omniauth
  end

  xscenario "logging in" do
    visit "/"

    expect(page.status_code).to eq(200)

    click_link "Log In"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Sebastian")
    expect(page).to have_link("Log out")
  end

  xscenario "logging in and logging out" do
    visit "/"

    expect(page.status_code).to eq(200)

    click_link "Log In"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Sebastian")
    expect(page).to have_link("Log out")

    click_link "Log out"

    expect(current_path).to eq("/")
    expect(page).to_not have_content("Sebastian")
    expect(page).to have_link("Log In")
  end
end
