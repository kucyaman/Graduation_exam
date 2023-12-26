class Book < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy


  validates :title, presence: true
  validates :design_type, presence: true
end
