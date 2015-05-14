class CreateDescriptionFiles < ActiveRecord::Migration

  def change
    create_table :description_files, force: true do |t|
      t.text :descripion
      t.integer :user_story_id
      t.string :source
      t.belongs_to :user_story, index: true

      t.timestamps
    end
  end
end
