class DescriptionFilesController < ApplicationController
  before_action :set_description_file, only: [:show, :edit, :update, :destroy]

  # GET /description_files
  # GET /description_files.json
  def index
    render_404
  end

  # GET /description_files/1
  # GET /description_files/1.json
  def show
    render_404
  end

  # GET /description_files/new
  def new
    render_404
  end

  # GET /description_files/1/edit
  def edit
    render_404
  end

  # POST /description_files
  # POST /description_files.json
  def create
    @user_story = UserStory.find(params[:user_story_id])
    @description_file = @user_story.description_files.create(description_file_params)

    respond_to do |format|
      if @description_file.save
        format.html { redirect_to @user_story, notice: 'Description file was successfully created.' }
        format.json { render :show, status: :created, location: @description_file }
      else
        format.html { redirect_to @user_story }
        format.json { render json: @description_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /description_files/1
  # PATCH/PUT /description_files/1.json
  def update
    respond_to do |format|
      if @description_file.update(description_file_params)
        format.html { redirect_to @description_file, notice: 'Description file was successfully updated.' }
        format.json { render :show, status: :ok, location: @description_file }
      else
        format.html { redirect_to @user_story  }
        format.json { render json: @description_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /description_files/1
  # DELETE /description_files/1.json
  def destroy
    @description_file.destroy
    respond_to do |format|
      format.html { redirect_to description_files_url, notice: 'Description file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description_file
      begin
        @description_file = DescriptionFile.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_404
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def description_file_params
      params.require(:description_file).permit(:descripion, :user_story_id, :source, :user_story_id)
    end
end
