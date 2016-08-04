class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :tile
      t.text :description
      t.timestamps
    end
  end
end
