class Course < ApplicationRecord
  include Bucketable, Vaultable, Rateable
  include Effort
  
  has_many :tracks
  
  validates :title, presence: true
  
  # Called from CoursesController to verify in a 
  # lazy loaded fashion, that all content is in DB, & 
  # will do that check each time the page is loaded (+memoized)
  # 
  # :params: none
  # :return: [self] to chain queries
  # 
  # ==== Example
  # 
  #   Course.lazy_load_courses.all
  #     # => Proxy for Course.all
  def self.lazy_load_courses
    unless @courses
      @courses ||= Clients::Github.all.each { |repo| 
        repo.save!
      }
    end
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