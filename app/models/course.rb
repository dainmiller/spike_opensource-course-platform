class Course < ApplicationRecord
  include Vaultable, Recordable, Bucketable, Attendees

  validates :title, presence: true
  
  after_create do
    record self
  end
  
  def to_s
    title
  end
  
end

