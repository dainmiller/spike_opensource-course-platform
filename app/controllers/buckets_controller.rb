class BucketsController < ApplicationController
  
  # ==== Search Result Format
  # => [<ActiveRecord::Relation=[]>, <ActiveRecord::Relation=[]>]
  def search
    @results = Bucket.find_all_by params[:s]
  end
  
end