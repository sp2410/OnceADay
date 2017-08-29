class CreateParagraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :paragraphs do |t|
      t.string :contents

      t.timestamps
    end
  end
end
