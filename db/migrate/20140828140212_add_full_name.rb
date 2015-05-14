class AddFullName < ActiveRecord::Migration

  def change

  	User.all.each do |user|
  		user.full_name = "#{user.first_name} #{user.last_name}"
  	end

  end

end
