class Bucket < ApplicationRecord
  include Recordable, Searchable, Commentable, Recommendable
  
  belongs_to :bucketable, polymorphic: true
  has_many :statuses
end
