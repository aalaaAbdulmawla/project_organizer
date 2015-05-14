class ProjectComment < ActiveRecord::Base
  belongs_to :project
  validates :comment, presence:true
end
