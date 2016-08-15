class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
  has_many :payments

  validate :uniqueness_of_date_range

  before_save :total_cost_calculation

  def total_cost_calculation
      self.total_price = (self.end_date - self.start_date).to_i * self.listing.cost_per_night
  end

  def uniqueness_of_date_range
  	@listing = self.listing
    errors.add(:start_date, "is not available") unless @listing.reservations.where("? >= start_date AND ? <= end_date",
                                                            start_date, start_date).count == 0
    errors.add(:end_date, "is not available") unless @listing.reservations.where("? >= start_date AND ? <= end_date",
                                                            end_date, end_date).count == 0
  end
end
