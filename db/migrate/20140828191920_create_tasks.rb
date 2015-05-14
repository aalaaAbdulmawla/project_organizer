class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :state
      t.belongs_to :user_story, index: true

      t.timestamps
    end
  end
end
