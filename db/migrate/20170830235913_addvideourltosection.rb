class Addvideourltosection < ActiveRecord::Migration[5.1]
  def change
  	add_column :sections, :video_url, :string
  end
end
