require 'rails_helper'

RSpec.feature 'Create account when user is created' do
  context 'when user is created' do
    scenario 'show account list when user is created' do
      sign_up 'test@gmail.com', '12343456'

      visit accounts_path

      within '.accounts' do
        expect(page).to have_content t('default_account_name')
      end
    end
  end
end
