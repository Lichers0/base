require 'rails_helper'

feature 'Create account when user is created' do
  scenario 'show account list when user is created' do
    visit sign_up_path
    fill_in t 'email', with: 'test@gmail.com'
    fill_in t 'password', with: '12345678'
    fill_in t 'password_confirmation', with: '12345678'

    click_on 'signup'
    visit accounts_path

    within '.accounts' do
      expect(page).to have_content t 'default_account_name'
    end
  end
end
