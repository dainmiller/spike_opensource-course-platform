class Bucket < ApplicationRecord
  include Recordable, Searchable, Commentable
  
  belongs_to :bucketable, polymorphic: true
  has_many :statuses
end