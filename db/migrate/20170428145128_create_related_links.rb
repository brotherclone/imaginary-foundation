class CreateRelatedLinks < ActiveRecord::Migration
  def change
    drop_table :related_links
    create_table :related_links do |t|
      t.string :url
      t.string :title
      t.belongs_to :project
      t.timestamps
    end
  end
end
