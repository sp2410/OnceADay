class MailedPost < ApplicationRecord


	def self.get_all_mailedpost_ids
		return MailedPost.pluck(:post_id)
	end

end
