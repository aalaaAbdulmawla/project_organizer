json.array!(@project_comments) do |project_comment|
  json.extract! project_comment, :id, :project_id, :creator, :comment
  json.url project_comment_url(project_comment, format: :json)
end
