module FeatureHelper
  def sign_up(email, password)
    visit new_user_registration_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password

    click_on t 'devise.registrations.new.sign_up'
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_on t 'devise.sessions.new.sign_in'
  end
end
