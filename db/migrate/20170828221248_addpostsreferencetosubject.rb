class Addpostsreferencetosubject < ActiveRecord::Migration[5.1]
  def change
  	add_reference :posts, :subject, foreign_key: true  	
  end
end
