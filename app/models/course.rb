class Course < ApplicationRecord
  include Bucketable, Vaultable, Rateable
  include Effort
  
  has_many :tracks
  
  validates :title, presence: true
  
  def to_s
    title
  end

  def comments
    bucket.comments
  end

  def reviews
    bucket.reviews
  end
  
end