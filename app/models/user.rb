class User < ApplicationRecord
  has_many :access_rights, dependent: :destroy
  has_many :accounts, through: :access_rights

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :create_default_account, on: :create

  private

  def create_default_account
    accounts.create(name: I18n.t('default_account_name'))
  end
end
