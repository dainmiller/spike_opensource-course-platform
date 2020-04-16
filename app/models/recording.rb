class Recording < ApplicationRecord
  include Recordable
  
  def initialize entity
    @entity       = entity
    @recordable   = Recordable.build(self)
  end
  
  def save
    @recordable.save!
  end
  
end