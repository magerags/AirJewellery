class Jewellery < ApplicationRecord
  belongs_to :user
  has_one :loan
end
