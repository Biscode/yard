json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :deadline
  json.url project_url(project, format: :json)
end
