module Recordable
  extend ActiveSupport::Concern

  included do
    has_many :recordings

    # The #.record API is meant to be included in 
    # classes with a recording relationship.
    # 
    # #.record is only meant to be used in `after_*`
    # rails callbacks. This is why we pass `entity` as a 
    # parameter, instead of using an `entity.record` API.
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
    def record entity
      save_with entity
    end
  end
  
  def save_with entity
    entity.recordings.create \
      recording_type: entity.class.table_name,
      status: 'active'
  end
  
end

