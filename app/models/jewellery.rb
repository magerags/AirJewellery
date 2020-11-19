class Jewellery < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one :loan
end
