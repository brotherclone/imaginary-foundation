class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :tile
      t.text :body
      t.text :description
      t.timestamps
    end
  end
end
