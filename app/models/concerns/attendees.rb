module Attendees
  extend ActiveSupport::Concern
  
  included do
    has_many :users
    
    # API interface for people that have 
    # a relationship to entities that allow for 'attendance'. 
    # 
    # ==== Example
    #
    #   course = Course.create
    #   course.users << [User.first, User.second, User.third]
    #   course.people # => [user1, user2, user3]
    #  
    # As opposed to my original API: 
    #   course.people(course) # => [user1, user2]
    def people
      self.users if respond_to? :users
    end
  end
end