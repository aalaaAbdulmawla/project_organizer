class UserStoryCommentsController < ApplicationController
  before_action :set_user_story_comment, only: [:show, :edit, :update, :destroy]

  # GET /user_story_comments
  # GET /user_story_comments.json
  def index
    render_404
  end

  # GET /user_story_comments/1
  # GET /user_story_comments/1.json
  def show
    render_404
  end

  # GET /user_story_comments/new
  def new
    render_404
  end

  # GET /user_story_comments/1/edit
  def edit
    render_404
  end

  # POST /user_story_comments
  # POST /user_story_comments.json
  def create
    @user_story = UserStory.find(params[:user_story_id])
    @user_story_comment = @user_story.user_story_comments.create(user_story_comment_params)
    @user_story_comment.creator = current_user.id

    respond_to do |format|
      if @user_story_comment.save
        format.html { redirect_to @user_story, notice: 'User story comment was successfully created.' }
        format.json { render :show, status: :created, location: @user_story_comment }
        format.js
      else
        format.html {redirect_to @user_story }
        format.json { render json: @user_story_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_story_comments/1
  # PATCH/PUT /user_story_comments/1.json
  def update
    respond_to do |format|
      if @user_story_comment.update(user_story_comment_params)
        format.html { redirect_to @user_story , notice: 'User story comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story_comment }
      else
        format.html {redirect_to @user_story  }
        format.json { render json: @user_story_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_story_comments/1
  # DELETE /user_story_comments/1.json
  def destroy
    @user_story_comment.destroy
    respond_to do |format|
      format.html { redirect_to @user_story , notice: 'User story comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story_comment
      begin
        @user_story_comment = UserStoryComment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_404
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_comment_params
      params.require(:user_story_comment).permit(:comment, :creator, :user_story_id)
    end
end
