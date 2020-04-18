module RatingApi
  extend ActiveSupport::Concern
  
  def rate
    @course = Course.find params[:id]
    @course.rate_with params[:rating]
    respond_with @course
  end
  
end