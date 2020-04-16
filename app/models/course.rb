class Course < ApplicationRecord
  include Vaultable, Recordable, Bucketable

  validates :title, presence: true
  
  after_commit :record, on: [:create, :update]
  
  def record
    Recordable.for self
  end
  
end