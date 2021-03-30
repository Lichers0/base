require 'rails_helper'

feature 'authenticate user can edit supplier' do
  feature 'authenticate user' do
    let!(:user) { create(:user) }
    let(:account) { build(:account) }
    # let!(:supplier) { create(:supplier, name: 'Old name', account: account) }

    before do
      sign_in user
      create(:supplier, name: 'Old name', account: account)
    end

    scenario 'updates supplier' do
      visit suppliers_path

      within '.suppliers' do
        expect(page).to have_content 'Old name'

        click_on t 'suppliers.supplier.edit'
      end

      within 'form.edit_supplier' do
        fill_in 'supplier_name', with: 'New name'
        click_on t 'suppliers.form.save'
      end

      visit suppliers_path

      within '.suppliers' do
        expect(page).to have_content 'New name'
      end
    end
  end
end
