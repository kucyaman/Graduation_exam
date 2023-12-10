class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags
  
  validates :image, presence: true

end
