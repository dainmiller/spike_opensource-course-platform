class CoursesController < ApplicationController
  include RatingApi, EffortApi
  
  respond_to :html, :json
  
  # TODO: Extract to an ActiveJob so I don't need to call this
  # from the web layer, and can offset it to a diff set of worker
  # servers - app servers not meant to pull in data from an API.
  # Course.lazy_load_courses.all 
  def index
    @courses ||= Course.all
  end
  
  def show
    @course ||= Course.find params[:id]
  end
  
end