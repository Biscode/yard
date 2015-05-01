module ProjectsHelper
	def isAdmin(user)
	  return user.isAdmin
	end

	def canView(user, project)
	  for team in project.teams do
	    for member in team.users do
	      if member.email == user.email
	        return true
	      end
	    end
	  end

	  return false

	end
end
