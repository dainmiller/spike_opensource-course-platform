class Track < ApplicationRecord
  belongs_to :course
  has_many :lessons

  validates :course, presence: true

  def to_s
    title
  end
end
