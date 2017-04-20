ActiveAdmin.register PromoCard do
  permit_params :project_id, :essay_id, :image_id
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :project_id, :label => 'Project', :as => :select, :collection => Project.all.map{|p| ["#{p.title}", p.id]}
      f.input :essay_id, :label => 'Essay', :as => :select, :collection => Essay.all.map{|e| ["#{e.title}", e.id]}
      f.input :image_id, :label => 'Card Image', :as => :select, :collection => Image.all.map{|i| ["#{i.name}", i.id]}
    end
    f.actions
    end
end



