class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age,  inclusion: { in: 8..18, message: 'age must be greater than or equal to 8 and less than or equal to 18' }
end
