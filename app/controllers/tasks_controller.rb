class TasksController < ApplicationController
  before_action :set_task, only: [:update]

  # GET /tasks
  # GET /tasks.json
  def index
   render_404 
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    render_404
  end

  # GET /tasks/new
  def new
    render_404
  end

  # GET /tasks/1/edit
  def edit
    render_404
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user_story = UserStory.find(params[:user_story_id])
    @task = @user_story.tasks.create(task_params)
    respond_to do |format|
      if @task.save
        @task.state = "0"
        @task.save
        format.html { redirect_to @user_story, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        format.js
      else
        format.html { redirect_to @user_story }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @user_story = UserStory.find(params[:user_story_id])
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @user_story, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        format.js
      else
        format.html { redirect_to @user_story, notice: 'Task was not successfully updated.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @user_story, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
        @task = Task.find(params[:id])
        @user_story = UserStory.find(params[:user_story_id])
      rescue ActiveRecord::RecordNotFound
        render_404
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :state, :user_story_id)
    end
end
