class Task < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :project

	validates_presence_of :deadline



	belongs_to :team
	belongs_to :user
	 attr_accessor :assignee

def self.finduser(taskid)
getid = Task.find(taskid).user_id
if getid == nil
	assignee = "No Assignee"
else 
assignee = User.find(getid).username
end
end

	# validates_presence_of :deadline
end
