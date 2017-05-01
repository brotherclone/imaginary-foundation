ActiveAdmin.register RelatedLink do
  permit_params :title, :url, :project_id
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :url
      f.input :project_id, :label => 'Project', :as => :select, :collection => Project.all.map{|e| ["#{e.title}", e.id]}
    end
    f.actions
  end
end
