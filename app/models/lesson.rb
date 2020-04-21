class Lesson < ApplicationRecord
  belongs_to :track, optional: true
  
  validates :track, presence: true
end
