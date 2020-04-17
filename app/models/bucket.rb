class Bucket < ApplicationRecord
  include Recordable
  
  belongs_to :bucketable, polymorphic: true
end
