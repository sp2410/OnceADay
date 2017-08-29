class CreateAudios < ActiveRecord::Migration[5.1]
  def change
    create_table :audios do |t|
      t.string :contenturl

      t.timestamps
    end
  end
end
