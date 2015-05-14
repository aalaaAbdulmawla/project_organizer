class UserStoryComment < ActiveRecord::Base
  belongs_to :user_story
  validates :comment, presence:true
end
