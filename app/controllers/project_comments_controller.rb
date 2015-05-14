class ProjectCommentsController < ApplicationController
  before_action :set_project_comment, only: [:show, :edit, :update, :destroy]

  # GET /project_comments
  # GET /project_comments.json
  def index
    render_404
  end

  # GET /project_comments/1
  # GET /project_comments/1.json
  def show
    render_404
  end

  # GET /project_comments/new
  def new
    render_404
  end

  # GET /project_comments/1/edit
  def edit
    render_404
  end

  # POST /project_comments
  # POST /project_comments.json
  def create
    @project = Project.find(params[:project_id])
    @project_comment = @project.project_comments.create(project_comment_params)
    @project_comment.creator = current_user.id

    respond_to do |format|
      if @project_comment.save       
        format.html { redirect_to @project, notice: 'Project comment was successfully created.' }
        format.json { render :show, status: :created, location: @project_comment }
        format.js
      else
        format.html { redirect_to @project_comment.project}
        format.json { render json: @project_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_comments/1
  # PATCH/PUT /project_comments/1.json
  def update
    respond_to do |format|
      if @project_comment.update(project_comment_params)
        format.html { redirect_to @project_comment.project, notice: 'Project comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_comment }
      else
        format.html { redirect_to @project_comment.project }
        format.json { render json: @project_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_comments/1
  # DELETE /project_comments/1.json
  def destroy
    @project_comment.destroy
    respond_to do |format|
      format.html { redirect_to @project_comment.project, notice: 'Project comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_comment
      begin
        @project_comment = ProjectComment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_404
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_comment_params
      params.require(:project_comment).permit(:project_id, :creator, :comment)
    end
end
