require 'test_helper'

class DescriptionFilesControllerTest < ActionController::TestCase
  setup do
    @description_file = description_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:description_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create description_file" do
    assert_difference('DescriptionFile.count') do
      post :create, description_file: { descripion: @description_file.descripion, source: @description_file.source, user_story_id: @description_file.user_story_id, user_story_id: @description_file.user_story_id }
    end

    assert_redirected_to description_file_path(assigns(:description_file))
  end

  test "should show description_file" do
    get :show, id: @description_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @description_file
    assert_response :success
  end

  test "should update description_file" do
    patch :update, id: @description_file, description_file: { descripion: @description_file.descripion, source: @description_file.source, user_story_id: @description_file.user_story_id, user_story_id: @description_file.user_story_id }
    assert_redirected_to description_file_path(assigns(:description_file))
  end

  test "should destroy description_file" do
    assert_difference('DescriptionFile.count', -1) do
      delete :destroy, id: @description_file
    end

    assert_redirected_to description_files_path
  end
end
