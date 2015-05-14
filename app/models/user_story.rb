class UserStory < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy 
  accepts_nested_attributes_for :tasks, :reject_if => lambda {|a| a[:description].blank?}

  has_many :users, :through => :user_story_user_relations
  has_many :user_story_user_relations

  has_many :user_story_comments, :dependent => :destroy

  has_many :description_files, :dependent => :destroy
  
  after_save :add_project_user_relation

  validates :name, :description, presence:true

  private
    def add_project_user_relation
      project = self.project
      self.users.each do |user|     
        if !project.users.include? user
          project.users << user
        end
      end
    end

end
