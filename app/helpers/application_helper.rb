require 'emailnotifier'

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


	
    def send_email(post, subject, message, user)
      from = 'yourpost@onceaday.today'          
      content = "<html><head><style type='text/css'>body,html,.body{background:#D3D3D3!important;}</style></head><body><container><spacer size='16'></spacer><row><columns><center><img class='small-float-center' width='500px' height='300px' src=#{Post.find_by_id(post.id).heroimage}></center></columns></row><row><columns large='8'><center><h2>Once A Day</h2></center></columns></row><row><columns large='6'><center><h4>Hey! Go on..just putting your selected post in your inbox for you to read</h4><br><p>#{message}</p><br><p>Follow: http://www.onceaday.today/subjects/#{post.subject_id}/posts/#{post.id} to learn something cool a user posted for today. </p><center></columns><columns large='6'><br><p>If you have any issues or suggestions, send me an email (just be nice!): </p><br><p>Email:sprakash24oct@gmail.com </p></columns><columns large='4'><img class='small-float-center' width='100px' height='100px' src='//s3-us-west-2.amazonaws.com/wacbacassetsdonttouch/wacbacassets/onceadaylogo.png' alt='once a day'></columns></row><row></row></container><body></html>"
      @notifier = EmailNotifier.new(from, user, subject, content)
      @notifier.send
    end
    

end