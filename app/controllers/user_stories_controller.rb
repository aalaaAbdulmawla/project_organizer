class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]
  before_action :permit_edit, only:[:edit]
  before_action :permit_show, only:[:show]
  before_action :authenticate_user!


  def permit_edit
    if (current_user.id != @user_story.project.creator)
      render_404
    end   
  end

  def permit_show
    if !@user_story.users.include? current_user
      render_404
    end
  end



  # GET /user_stories
  # GET /user_stories.json
  def index
    render_404
  end

  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
    @user_story.tasks.build    
    @tasks = @user_story.tasks.all 
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
    @tasks = @user_story.tasks.build
  end

  # GET /user_stories/1/edit
  def edit
  end

  # POST /user_stories
  # POST /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)

    respond_to do |format|
      if @user_story.save
        if !@user_story.users.include? current_user
          @user_story.users << current_user
        end
        format.html { redirect_to @user_story, notice: 'User story was successfully created.' }
        format.json { render :show, status: :created, location: @user_story }
      else
        format.html { render :new }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1
  # PATCH/PUT /user_stories/1.json
  def update
    respond_to do |format|
      if @user_story.update(user_story_params)
        if !@user_story.users.include? current_user
          @user_story.users << current_user
        end
        format.html { redirect_to @user_story.project, notice: 'User story was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_stories/1
  # DELETE /user_stories/1.json
  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: 'User story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      begin
        @user_story = UserStory.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_404
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_params
      params.require(:user_story).permit(:name, :description, :state, :project_id, { :user_ids => [] },
        :tasks_attributes => [:id, :user_story_id,:description, :state],
        :user_story_comments_attributes => [:id, :user_story_id, :comment], 
        :description_files_attributes => [:id, :user_story_id, :description, :source])
    end
end
