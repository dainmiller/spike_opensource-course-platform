class AddUrlToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :url, :text
  end
end
