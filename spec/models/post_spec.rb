require 'rails_helper'

RSpec.describe Post, type: :model do
  

	context 'getparagraph' do

			  it "gets the first paragraph" do

			  	
			    
				calculator = Calculator.new
				result = calculator.calculate('4 5 +')			
				expect(result).to eq 9.0
				

			  end
	end

end
