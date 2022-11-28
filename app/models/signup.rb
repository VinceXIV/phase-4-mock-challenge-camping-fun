class Signup < ApplicationRecord
  belongs_to :activity
  belongs_to :camper

  validates :time, numericality: {less_than_or_equal_to: 23, greater_than_or_equal_to: 0}
end
