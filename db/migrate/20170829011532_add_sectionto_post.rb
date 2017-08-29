class AddSectiontoPost < ActiveRecord::Migration[5.1]
  def change
  	add_reference :sections, :post, foreign_key: true  
  end
end
