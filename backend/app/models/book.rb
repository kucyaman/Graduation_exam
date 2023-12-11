class Book < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy

  validates :title, presence: true
  validates :cover, presence: true
  validates :back_cover, presence: true

end
