class Book < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy

  accepts_nested_attributes_for :pages

  validates :title, presence: true
  validates :design_type, presence: true
end
