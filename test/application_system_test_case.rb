require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

  def sign_in(user, password: "password")
    visit new_session_url
    fill_in :email_address, with: user.email_address
    fill_in :password, with: password

    click_on "Sign in"
  end

  # Wraps around the `visit` method, signs the current @user
  # and redirects back to the given `url`.
  def visit_wrapped(url)
    visit url
    sign_in @user
  end
end
