class Notification
  include Notifiable
  
  def initialize recording
    @recording = recording
    Notifiable.for(self).save
  end
  
end