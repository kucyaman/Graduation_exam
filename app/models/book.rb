class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :design_type, presence: true
end
