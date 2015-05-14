class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects, force: true do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
