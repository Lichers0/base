require 'rails_helper'

feature 'authenticate user can create supplier' do
  describe 'authenticate user' do
    scenario 'creates supplier' do
      visit suppliers_path
    end
  end
end
