require 'test_helper'

class UserStoryCommentsControllerTest < ActionController::TestCase
  setup do
    @user_story_comment = user_story_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_story_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_story_comment" do
    assert_difference('UserStoryComment.count') do
      post :create, user_story_comment: { comment: @user_story_comment.comment, creator: @user_story_comment.creator, user_story_id: @user_story_comment.user_story_id }
    end

    assert_redirected_to user_story_comment_path(assigns(:user_story_comment))
  end

  test "should show user_story_comment" do
    get :show, id: @user_story_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_story_comment
    assert_response :success
  end

  test "should update user_story_comment" do
    patch :update, id: @user_story_comment, user_story_comment: { comment: @user_story_comment.comment, creator: @user_story_comment.creator, user_story_id: @user_story_comment.user_story_id }
    assert_redirected_to user_story_comment_path(assigns(:user_story_comment))
  end

  test "should destroy user_story_comment" do
    assert_difference('UserStoryComment.count', -1) do
      delete :destroy, id: @user_story_comment
    end

    assert_redirected_to user_story_comments_path
  end
end
