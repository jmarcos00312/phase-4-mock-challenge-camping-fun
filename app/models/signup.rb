class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  validates :time, inclusion: { in: 0..23, message: 'age must be greater than or equal to 8 and less than or equal to 18' }
end
