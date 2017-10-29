class AddreceiveemailToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :receive_email, :boolean, default: false
  end
end
