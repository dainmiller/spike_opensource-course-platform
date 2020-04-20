class CreateContentRecommendations < ActiveRecord::Migration[6.0]
  
  def change
    create_table :content_recommendations do |t|
      t.references :recommendable, polymorphic: true, index: { name: 'index_content_recommendations_on_recommendable_and_user' }
      t.belongs_to :user
      t.timestamps
    end
  end
  
end
