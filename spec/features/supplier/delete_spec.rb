require 'rails_helper'

feature 'authenticate user can delete supplier' do
  feature 'authenticate user' do
    let!(:user) { create(:user) }
    let(:account) { build(:account) }
    let!(:supplier) { create(:supplier,
                             name: "Deleted supplier's name",
                             account: account) }

    scenario 'deletes supplier' do
      sign_in user
      visit suppliers_path

      expect(page).to have_content "Deleted supplier's name"

      click_on t 'suppliers.supplier.delete'

      expect(page).not_to have_content "Deleted supplier's name"
    end
  end
end
