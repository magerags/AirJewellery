class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :jewellery
  before_create :assign_total_price
  validates :from, :to, presence: true, availability: true
  validate :from_after_to



  def assign_total_price
    self.total_price = extract_total_price
  end

  def extract_total_price
    extract_days * self.jewellery.price

  end

  def extract_days
    ((self.to - self.from) / 3600 / 24).to_i
 end
end

private

def from_after_to
  return if from.blank? || to.blank?

   if to < from
     errors.add(:to, "must be after the start date")
  end

end
