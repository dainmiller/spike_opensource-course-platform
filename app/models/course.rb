class Course < ApplicationRecord
  include Bucketable, Vaultable, Rateable
  include Effort
  
  has_many :tracks
  
  validates :title, presence: true
  
  # TODO: Move this to a service object when moving for 
  # ActiveJob 
  def self.lazy_load
    @courses ||= Clients::Github.all.each { |repo| 
      repo.save!
    }
    self
  end
  
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