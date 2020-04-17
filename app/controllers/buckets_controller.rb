class BucketsController < ApplicationController
  
  # ==== Search Result Format
  #   # => [<Course=[]>, <Vault=[]>, etc]
  def search
    @results = Bucket.find_all_by params[:s]
  end
  
end