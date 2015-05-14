class AddCreator < ActiveRecord::Migration
  def change
  	add_column :projects, :creator, :integer
  end
end
