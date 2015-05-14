class DescriptionFile < ActiveRecord::Base
  belongs_to :user_story
  validates :descripion, :source, presence:true
  mount_uploader :source, DescriptionFilesUploader
end
