class Jewellery < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :loans

  def unavailable_dates
    loans.pluck(:from, :to).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end

