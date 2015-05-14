json.array!(@user_story_comments) do |user_story_comment|
  json.extract! user_story_comment, :id, :comment, :creator, :user_story_id
  json.url user_story_comment_url(user_story_comment, format: :json)
end
