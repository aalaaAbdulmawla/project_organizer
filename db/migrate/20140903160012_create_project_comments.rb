class CreateProjectComments < ActiveRecord::Migration
  def change
    create_table :project_comments do |t|
      t.belongs_to :project, index: true
      t.integer :creator
      t.text :comment

      t.timestamps
    end
  end
end
