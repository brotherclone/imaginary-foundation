class ImageIndexes < ActiveRecord::Migration
  def change
    add_reference :images, :gallery, index:true
    add_reference :images, :project, index:true
    add_reference :images, :essay, index:true
  end
end
