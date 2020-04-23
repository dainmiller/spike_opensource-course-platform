class LessonsController < ApplicationController
  respond_to :html, :json
  
  def show
    @lesson ||= Lesson.find params[:id]
		@decoded_content ||= Base64.decode64 @lesson.body
  end
  
  def track_param
    params.require(:lesson).permit :id, :title, :body, :url
  end
end