class Task < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :project
	has_many :comments
	validates_presence_of :deadline
	belongs_to :user
	belongs_to :team
	belongs_to :user
	 attr_accessor :assignee

## Heba
## gets the user assigned name assigned to the task by tasking the task_id
def self.finduser(taskid)
getid = Task.find(taskid).user_id
if getid == nil
	assignee = "No Assignee"
 else 
  assignee = User.find(getid).username
end
end
end
