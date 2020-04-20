class BucketsController < ApplicationController
  include SearchApi
  
  respond_to :html, :json
  
end