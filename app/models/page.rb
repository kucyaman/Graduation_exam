class Page < ApplicationRecord
  belongs_to :book

  validates :page_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  mount_uploader :photo, PagesPhotoUploader
end
