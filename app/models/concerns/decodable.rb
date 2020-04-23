module Decodable
  extend ActiveSupport::Concern
  
  def decode encoded
    decoded ||= Base64.decode64 encoded
    return decoded
  end
  
end