class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :jewellery
  before_create :assign_total_price


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
