class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :provider, presence: true
  validates :uid, presence: true

end
