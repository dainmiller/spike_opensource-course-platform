class Course < ApplicationRecord
  include Recordable
  
  belongs_to :vault

  validates :title, presence: true
  
  after_create do
    Recordable.for(self).save
  end
  
end