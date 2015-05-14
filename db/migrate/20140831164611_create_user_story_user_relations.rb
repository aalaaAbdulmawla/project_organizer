class CreateUserStoryUserRelations < ActiveRecord::Migration
  def change
    create_table :user_story_user_relations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :user_story, index: true

      t.timestamps
    end
  end
end
