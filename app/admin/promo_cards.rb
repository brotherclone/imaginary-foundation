ActiveAdmin.register PromoCard do
  permit_params :project_id, :essay_id, :image_id
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :project_id, :label => 'Project', :as => :select, :collection => Project.all.map{|p| ["#{p.title}", p.id]}
      f.input :essay_id, :label => 'Essay', :as => :select, :collection => Essay.all.map{|e| ["#{e.title}", e.id]}
      f.inputs 'Image', for: [:image, f.object.image || Image.new] do |image_form|
        image_form.input :image_file, :as=> :file
        image_form.input :image_file_cache, :as=> :hidden
      end
    end
    f.actions
  end
end
