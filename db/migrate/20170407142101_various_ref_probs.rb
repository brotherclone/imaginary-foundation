class VariousRefProbs < ActiveRecord::Migration
  def change
    remove_reference :gallery_images, :images
  end
end


#  add_index "images", ["gallery_id"], name: "index_images_on_gallery_id", using: :btree
#   add_index "gallery_images", ["images_id"], name: "index_gallery_images_on_images_id", using: :btree


# create_table "gallery_images", force: true do |t|
#   t.integer "images_id"
#   t.integer "gallery_id"
# end
