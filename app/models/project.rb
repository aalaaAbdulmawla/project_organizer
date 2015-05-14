class Project < ActiveRecord::Base
	has_many :users, :through => :project_user_relations
	has_many :project_user_relations
	
	has_many :user_stories, :dependent => :destroy

	has_many :project_comments, :dependent => :destroy
	
	accepts_nested_attributes_for :user_stories, :reject_if => lambda {|a| a[:name].blank?}

	validates :title, :description, presence:true


end
