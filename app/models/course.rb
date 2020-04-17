class Course < ApplicationRecord
  include Bucketable, Attendees, Vaultable

  validates :title, presence: true
  
  def to_s
    title
  end
  
end

