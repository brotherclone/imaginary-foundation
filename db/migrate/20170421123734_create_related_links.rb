class CreateRelatedLinks < ActiveRecord::Migration
  def change
    create_table :related_links do |t|
      t.string :title
      t.string :url
      t.belongs_to :project, index: true
      t.timestamps
    end
    add_reference :related_links, :projects, index: true
  end
end



