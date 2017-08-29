class Post < ApplicationRecord	
	belongs_to :subject
	has_many :sections

	mount_uploader :heroimage, ImageUploader


	def getparagraph(post)
		post = Post.find_by_id(post.id)
		p post
		if post.sections.present?
			section = post.sections.where('content_type = ?','Paragraph').first.contents
			p section
			return section[0..200] + "..."
		end

		return "Post in Progress"
		
	end
end
