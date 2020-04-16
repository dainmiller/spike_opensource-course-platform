module Vaultable
  extend ActiveSupport::Concern
  
  included do
    belongs_to :vault, optional: true
  end
  
end