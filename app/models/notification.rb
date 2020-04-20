# TODO: Implement the following...
#
# A `Notification` is linked to a Recording record.
# 
# Everytime there is a Recording record created, we 
# eavesdrop on the recording  and notify anyone who is
# 'signed up' to receive notifications.
class Notification
  include Notifiable
end