class CreateUserStoryComments < ActiveRecord::Migration
  def change
    create_table :user_story_comments do |t|
      t.text :comment
      t.integer :creator
      t.belongs_to :user_story, index: true

      t.timestamps
    end
  end
end
