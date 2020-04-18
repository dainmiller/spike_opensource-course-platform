class CoursesController < ApplicationController
  include RatingApi, EffortApi
  
  respond_to :html, :json
  
  def index
    @courses ||= Course.all
  end
  
end