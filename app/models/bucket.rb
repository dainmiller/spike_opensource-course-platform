class Bucket < ApplicationRecord
  include Recordable, Searchable, Commentable, Reviewable
  
  belongs_to :bucketable, polymorphic: true

end