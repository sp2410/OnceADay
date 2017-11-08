require "#{Rails.root}/app/helpers/application_helper"

include ApplicationHelper



task :send_email => :environment do
	
	posts, mailed_posts = Post.get_all_post_ids, MailedPost.get_all_mailedpost_ids	 

	posts_ids_to_randomize = (posts - mailed_posts) | (mailed_posts - posts)
	p posts_ids_to_randomize

	if posts_ids_to_randomize.size > 0	
		users, post_id = User.emails_of_all_intrested_users, posts_ids_to_randomize.sample
		post = Post.find_by_id(post_id)
		begin			
			record = MailedPost.find_or_create_by(post_id: post_id)
	        send_email(post, "Go on..Just putting this cool post: #{post.title} in your inbox. ", "Hi! When you are free have a look at : #{post.title}", users)
	    rescue
	    	p "email not sent "
	    end
		puts post_id
	end
end



