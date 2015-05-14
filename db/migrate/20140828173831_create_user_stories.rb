class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.string :description
      t.string :state
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
