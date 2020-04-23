class Clients::Lessons::Lesson < ApiClient
  
  SETTINGS = {
    :table => Lesson
  }
  
  def initialize response:, track:
    @response = response
    @track    = track
    super
  end
  
  private
    def _save
      @lesson ||= table.find_or_create_by \
        track_id: @track.id, title: title, url: url
      lazy_load_lesson_data
    end
    
    def lazy_load_lesson_data
      data = fetch_and_parse @lesson.url.split('?')[0]
      encoded_content = data.fetch 'content'
      @lesson.update! body: encoded_content
      
      # TODO: Extract the above to....
      # Clients::Lessons::Lesson::Data.new(response: contents)
    end
  
end