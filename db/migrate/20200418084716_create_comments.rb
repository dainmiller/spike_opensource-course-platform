class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :bucket, null: false, foreign_key: true
      t.text :body
    end
  end
end