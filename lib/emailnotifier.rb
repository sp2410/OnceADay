require 'sendgrid-ruby'
require 'json'

class EmailNotifier

	include SendGrid

	attr_accessor :from, :to, :subject, :content

	def initialize(from, to, subject, content)
		@from = from
		@to = to
		@subject = subject
		@content = content		
	end


	def personalize		
		users = to

		email = Mail.new
		email.from = Email.new(email: @from)
		email.subject = subject

		personalization = Personalization.new	
		personalization.add_to(Email.new(email: "sprakash24oct@gmail.com"))

		users.each do |user|																
  			personalization.add_bcc(Email.new(email: user))					
		end

		email.add_personalization(personalization)
		email.add_content(Content.new(type: 'text/plain', value: "A new action was taken !!"))
		email.add_content( Content.new(type: 'text/html', value: content))
		

		
		# @email.template_id = '13b8f94f-bcae-4ec6-b752-70d6cb59f932'			
		email.reply_to = Email.new(email: 'sprakash24oct@gmail.com')

		p email.to_json
		return email
	end


	
	def send 
		use_sendgrid_to_send_email				
	end

	private

	def use_sendgrid_to_send_email
		begin	
				tosend = personalize

				sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])			
				response = sg.client.mail._('send').post(request_body: tosend.to_json)
				puts response.status_code
				puts response.body
				puts response.headers			
				return true
		rescue 			
				puts "Email Failure"			
				return false
		end	
	end

		
end



