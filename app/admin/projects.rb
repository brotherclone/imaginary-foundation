ActiveAdmin.register Project do
  permit_params :title, :body, :description, :external_url, :image_id
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :body, :input_html => {:class => 'tinymce'}, :label => 'Description'
      f.input :external_url
      f.input :images_id, :label => 'Main Image', :as => :select, :collection => Image.all.map{|i| ["#{i.title}", i.id]}
    end
    f.actions
  end
end
