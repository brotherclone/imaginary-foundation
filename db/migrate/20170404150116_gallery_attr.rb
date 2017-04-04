class GalleryAttr < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.belongs_to :galleries, index: true
      t.belongs_to :images, index: true
    end

    add_column :galleries, :title, :string

  end
end
