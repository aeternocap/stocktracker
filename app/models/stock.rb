class Stock < ActiveRecord::Base

  validates :symbol, presence: true

  scope :inverted50, -> { where( fiftyday_moving_average_inversion: true ) }
  scope :inverted200, -> { where( two_hundredday_moving_average_inversion: true ) }

  def self.inverted(amount)
    if amount == '50'
      self.inverted50
    elsif amount == '200'
      self.inverted200
    end
  end
end
