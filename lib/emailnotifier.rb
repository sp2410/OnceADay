require 'sendgrid-ruby'
require 'json'

class EmailNotifier

	include SendGrid

	attr_accessor :from, :to, :subject, :content

	def initialize(from, to, subject, content)
		@from, @to, @subject, @content = from, to, subject, content		 
	end


	def personalize		
		users, email = to, Mail.new		
		email.from, email.subject = Email.new(email: @from), subject		 
		personalization = Personalization.new	
		personalization.add_to(Email.new(email: "sprakash24oct@gmail.com"))
		users.each do |user|																
  			personalization.add_bcc(Email.new(email: user))					
		end
		email.add_personalization(personalization)
		email.add_content(Content.new(type: 'text/plain', value: "A new action was taken !!"))
		email.add_content( Content.new(type: 'text/html', value: content))			
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



