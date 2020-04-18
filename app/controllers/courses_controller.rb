class CoursesController < ApplicationController
  respond_to :html, :json
  
  def index
    @courses ||= Course.all
  end
  
  def rate
    @course = Course.find params[:id]
    @course.rate_with params[:rating]
    respond_with @course
  end
  
  def effort
    @course = Course.find params[:id]
    @course.estimate_effort params[:effort]
    respond_with @course
  end
  
end