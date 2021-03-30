require 'rails_helper'

feature 'authenticate user can create supplier' do
  feature 'authenticated user' do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    scenario 'creates supplier' do
      visit suppliers_path
      click_on t 'suppliers.index.add'

      fill_in 'supplier_name', with: 'Test LLC'
      click_on t 'suppliers.form.save'

      visit suppliers_path
      within '.suppliers' do
        expect(page).to have_content 'Test LLC'
      end
    end
  end

  feature 'unauthenticated user' do
    context 'when try to visit suppliers list' do
      before do
        visit suppliers_path
      end

      scenario { expect(page).to have_current_path new_user_session_path }
    end
  end
end
