class User < ActiveRecord::Base
	has_many :projects, :through => :project_user_relations
	has_many :project_user_relations

	has_many :user_stories, :through => :user_story_user_relations
  	has_many :user_story_user_relations 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	validates :first_name, :last_name, :email, presence:true

	#validates :password, allow_blank: true, length: {minimum: 6 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, allow_blank: true, format: { with: VALID_EMAIL_REGEX}

	validates :avatar_url, allow_blank: true, format:{
	 	with: %r{\.(gif|jpg|png)\Z}i,
	 	message: 'must be a URL for GIF, JPG, PNG image.'
	}

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	mount_uploader :avatar, ImageUploader



end
