
ActiveAdmin.register Image do
  permit_params :image_file, :title, :caption, :credit, :credit_link
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :caption, :input_html => {:class => 'tinymce'}, :label => 'Caption'
      f.input :credit
      f.input :credit_link
      f.input :image_file, :as => :file
      f.input :image_file_cache, :as => :hidden
    end
    f.actions
  end
end

