require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a name, provider, screen_name, uid, oauth_token, oauth_token_secret" do
    User.create(name: "Sebastian Abondano",
                provider: "twitter",
                screen_name: "sabondano1",
                uid: "12345",
                oauth_token: "token",
                oauth_token_secret: "secret")

    user = User.first

    expect(user.name).to eq("Sebastian Abondano")
    expect(user.provider).to eq("twitter")
    expect(user.screen_name).to eq("sabondano1")
    expect(user.uid).to eq("12345")
    expect(user.oauth_token).to eq("token")
    expect(user.oauth_token_secret).to eq("secret")
  end
end
