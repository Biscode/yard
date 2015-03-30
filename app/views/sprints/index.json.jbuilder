json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :number, :deadline
  json.url sprint_url(sprint, format: :json)
end
