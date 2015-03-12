json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :status, :priority, :story_points, :deadline
  json.url task_url(task, format: :json)
end
