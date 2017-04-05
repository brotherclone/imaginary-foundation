json.extract! gallery_image, :id, :created_at, :updated_at
json.url gallery_image_url(gallery_image, format: :json)