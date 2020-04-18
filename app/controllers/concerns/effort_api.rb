module EffortApi
  extend ActiveSupport::Concern
  
  def effort
    @course = Course.find params[:id]
    @course.estimate_effort params[:effort]
    respond_with @course
  end
  
end