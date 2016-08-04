class Tagfix < ActiveRecord::Migration
  def change
    rename_column :topics, :tile, :title
    add_reference :tags, :topic, index: true
    add_reference :essays, :topic, index: true
    add_reference :projects, :topic, index: true
  end
end
