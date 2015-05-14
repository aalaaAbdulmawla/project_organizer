class ProfileController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
	  if params[:search]
	    values = { search: "%#{ params[:search] }%" }

	    conditions = %q{ projects.title          LIKE :search
	                     OR projects.description LIKE :search
	                     OR user_stories.name    LIKE :search }

	    @projects = current_user.projects.joins(:user_stories)
	                  .where(conditions, values)
	  else
	    @projects = current_user.projects.order(:title)
	  end
	        
	  @projects = @projects.page(params[:page]).per_page(4) 

	end

end
