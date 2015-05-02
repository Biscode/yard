require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'tasks_counter' do
    it 'counts number of tasks in the given status' do
      @project = Project.create(title: 'Project 1')
      @task1 = @project.tasks.create(title: 'task 1', status: 'New')
      
      expect(@project.tasks_counter('New')).to eq 1
    end
  end

  describe 'tasks_counter_with_user_id' do
    it "counts number of tasks in the given status for the given user" do
      @user1 = User.create!(email: "ahmedsaleh8@gmail.com", password: "12345678")
      @project = Project.create(title: 'Project 1')
      @task1 = @project.tasks.create(title: 'task 1', status: 'Done', user_id: 1)
      
      expect(@project.tasks_counter_with_user_id('Done', @user1)).to eq 1
    end
  end

  describe 'users' do
    it 'returns all the users from project' do
      @project = Project.create(title: 'Project 1')

      @user1 = User.create!(email: "ahmedsaleh8@gmail.com", password: "12345678")
      @user2 = User.create!(email: "looly@gmail.com", password: '12345678')

      @team = Team.create(name: 'squad A', project_id: 1)
      @team.users << @user1
      @team.users << @user2

      expect(@project.users).to eq [@user1, @user2]
        
    end
  end
end
