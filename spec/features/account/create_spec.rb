require 'rails_helper'

RSpec.feature 'Create account when user is created' do
  context 'when user is created' do
    scenario 'show account list when user is created' do
      sign_up 'test@gmail.com', '12343456'

      visit accounts_path

      within '.accounts' do
        save_and_open_page
        expect(page).to have_content t('default_account_name')
      end
    end
  end

  private

  def sign_up(email, password)
    visit new_user_registration_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password

    click_on t 'devise.registrations.new.sign_up'
  end
end
