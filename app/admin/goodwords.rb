ActiveAdmin.register Goodword do
  permit_params :word, :good, :fromURL
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :word
      f.input :good, :as => :radio
      f.input :fromURL
    end
    f.actions
  end
end
