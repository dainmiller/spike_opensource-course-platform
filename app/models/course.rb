class Course < ApplicationRecord
  include Bucketable, Vaultable, Rateable

  validates :title, presence: true
  
  def to_s
    title
  end
  
end