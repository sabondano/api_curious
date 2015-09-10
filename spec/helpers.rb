module Helpers
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
          name: "Sebastian Abondano", 
          screen_name: "sabondano1",
        }
      },
      credentials: {
        token: "380478790-p7OtDesG3Oay2lhtwJh5h2BRxHEfX5MfCZNnolcG",
        secret: "uUezHHZjR2SRFrxbQcteAzzjlxsSHJMHiTTOtJeo29uyI"
      }
    })
  end
end
