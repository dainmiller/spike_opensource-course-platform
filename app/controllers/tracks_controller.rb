class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def set_track
    @track ||= Track.find params[:id]
  end
  
  def track_param
    params.require(:track).permit :id, :title, :description
  end
end
