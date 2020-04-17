class Course < ApplicationRecord
  include Bucketable, Vaultable, Rateable
  include Effort

  validates :title, presence: true
  
  def to_s
    title
  end
  
end