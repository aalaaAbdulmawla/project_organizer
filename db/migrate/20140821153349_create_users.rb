class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :confirm_password
      t.string :avatar

      t.timestamps
    end
  end
end
