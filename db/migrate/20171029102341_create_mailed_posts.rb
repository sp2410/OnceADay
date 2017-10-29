class CreateMailedPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :mailed_posts do |t|
      t.integer :post_id
    end
  end
end
