class AddUrlToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :url, :text
  end
end
