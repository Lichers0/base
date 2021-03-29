class CreateAccessRights < ActiveRecord::Migration[6.1]
  def change
    create_table :access_rights do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
