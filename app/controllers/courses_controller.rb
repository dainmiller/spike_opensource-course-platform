class CoursesController < ApplicationController
  include RatingApi, EffortApi
  
  respond_to :html, :json
  
  def index
    @courses ||= Course.lazy_load_courses.all
  end
  
  def show
    @course ||= Course.find params[:id]
  end
  
end