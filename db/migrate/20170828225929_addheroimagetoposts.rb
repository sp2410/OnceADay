class Addheroimagetoposts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :heroimage, :string
  end
end
