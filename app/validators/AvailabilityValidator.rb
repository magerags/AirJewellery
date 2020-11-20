class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    loans = Loan.where(["jewellery_id =?", record.jewellery_id])
    date_ranges = loans.map { |b| b.from..b.to }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
