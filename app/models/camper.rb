class Camper < ApplicationRecord
    has_many :signups, dependent: :destroy
    has_many :activities, through: :signups
    
    validates :name, presence: true
    validates :age, presence: true, numericality: {greater_than: 9, less_than: 18}
end
