module Vaultable
  extend ActiveSupport::Concern
  
  included do
    belongs_to :vault
  end
  
end