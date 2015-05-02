class Sprint < ActiveRecord::Base
  belongs_to :project
  has_many :tasks

  def tsp
  	self.tasks.sum(:story_points)
  end

end
