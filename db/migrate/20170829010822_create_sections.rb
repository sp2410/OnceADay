class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :content_type
      t.string :contents
      t.string :external_url

      t.timestamps
    end
  end
end
