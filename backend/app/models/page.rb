class Page < ApplicationRecord
  belongs_to :photo
  belongs_to :book

  validates :page_number, presence: true

end
