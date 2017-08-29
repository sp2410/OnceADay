module ApplicationHelper

	def isowner(post)
		if user_signed_in?
			# p "hello"
			if post.user_id == current_user.id
				return true
			end
		end
		return false
	end
end
