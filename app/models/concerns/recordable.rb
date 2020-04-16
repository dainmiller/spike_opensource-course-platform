module Recordable
  extend ActiveSupport::Concern
  
  included do
    has_many :recordings

    # The #.record API is meant to be included in 
    # classes with a recording relationship.
    # 
    # #.record is only meant to be used in `after_*`
    # rails callbacks. This is why we pass entity as 
    # a parameter, instead of an `entity.record` API.
    # 
    # ==== Example
    # 
    #   class Course
    #     include Recordable
    #
    #     after_commit do
    #       record self # => <Recording type='Course' status='active'>
    #     end
    #   end
    def record
      Recordable.for(self)
    end
  end
  
  def self.for entity
    entity.recordings.create \
      type: entity.class.table_name,
      status: 'active'
  end
  
end