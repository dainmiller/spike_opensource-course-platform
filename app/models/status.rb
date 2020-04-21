class Status < ApplicationRecord
  belongs_to :bucket
  belongs_to :user
  
  def unstarted?
    false
  end
  
end
