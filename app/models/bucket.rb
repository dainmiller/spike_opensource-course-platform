class Bucket < ApplicationRecord
  include Recordable, Searchable
  
  belongs_to :bucketable, polymorphic: true
end
