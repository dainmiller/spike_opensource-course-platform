class Recording < ApplicationRecord
  belongs_to :recordable, polymorphic: true
end