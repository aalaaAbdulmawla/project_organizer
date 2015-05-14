module CurrentUserStory
	extend ActiveSupport::Concern

	private
		def set_user_story
			@user_story = UserStory.find(session[:user_story_id])
			rescue ActiveRecord::RecordNotFound
			@user_story = UserStory.create
			session[:user_story_id] = @user_story.id
		end

end