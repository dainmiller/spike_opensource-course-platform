class Vault < ApplicationRecord
  include Bucketable
  
  has_many :courses
end
