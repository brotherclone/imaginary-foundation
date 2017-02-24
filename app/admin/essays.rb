ActiveAdmin.register Essay do
  permit_params :title, :body, :description
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :body, :input_html => {:class => 'tinymce'}, :label => 'Description'
      f.inputs 'Image', for: [:image, f.object.image || Image.new] do |image_form|
        image_form.input :image_file, :as=> :file
        image_form.input :image_file_cache, :as=> :hidden
      end
    end
    f.actions
  end
end
