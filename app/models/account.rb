class Account < ApplicationRecord
  has_many :access_rights, dependent: :destroy
  has_many :users, through: :access_rights
  has_many :suppliers, dependent: :destroy
end
