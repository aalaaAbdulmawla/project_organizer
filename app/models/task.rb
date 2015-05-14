class Task < ActiveRecord::Base
  belongs_to :user_story


  validates :description, presence:true

end
