class Tagwtf < ActiveRecord::Migration
  def change
    drop_table :tags
    create_table :tags do |tag|
      tag.string :name
      tag.string :description
      tag.integer :taggable_id
      tag.string :taggable_type
    end
  end
end
