ActiveAdmin.register PullQuote do
  permit_params :quote, :essay_id
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :quote, :input_html => {:class => 'tinymce'}, :label => 'Description'
      f.input :essay_id, :label => 'Essay', :as => :select, :collection => Essay.all.map{|e| ["#{e.title}", e.id]}
    end
    f.actions
  end
end
