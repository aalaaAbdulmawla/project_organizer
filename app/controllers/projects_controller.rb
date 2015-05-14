class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :permit_edit, only:[:edit]
  before_action :permit_show_project, only:[:show]

  def permit_edit
    if (current_user.id != @project.creator)
      render_404
    end   
  end

  def permit_show_project
    members = @project.users
    if (!members.include? current_user)
      render_404
    end   
  end
  # GET /projects
  # GET /projects.json
  def index
    render_404
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @user_stories = @project.user_stories.all
    if @user_stories
      @open_stories = @user_stories.where(:state => "To be done")
      @in_progress_stories = @user_stories.where(:state => "In progress")
      @to_be_verivied_stories = @user_stories.where(:state => "To be verified")
      @completed_stories = @user_stories.where(:state => "Completed")
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    stories = @project.user_stories.build 
    stories.tasks.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.creator = current_user.id
    respond_to do |format|
      if @project.save
        @project.users << current_user

        @project.user_stories.each do |story|
          story.state = "To be done"
          story.users << current_user
          story.tasks.each do |task|
            task.state = "0"
            task.save!
          end
          story.save!
        end
 
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        @new_stories = @project.user_stories.where(:state => nil)
        @new_stories.each do |story|
          story.state = "To be done"
          story.users << current_user
          story.save!
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to :controller => 'profile', :action => 'index', notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      begin
        @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_404
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id, :title, :description, user_stories_attributes: 
        [:id, :name, :description, :project_id, :tasks_attributes => [:id, :user_story_id,:description]],
        :project_comments_attributes => [:id, :project_id, :comment])
    end
end
