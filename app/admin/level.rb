ActiveAdmin.register Level do
  belongs_to :language, optional: true
  permit_params :name, :enabled, :language_id
  menu label: "Poziomy", priority: 3

  filter :language_id, label: "Język", as: :select, collection: ->{ Language.all }
  filter :enabled, label: "Aktywny?"
  
  index do
    selectable_column
    column "Język" do |level|
      link_to Language.find(level.language_id).name, admin_language_path(level.language_id)
    end
    column "Poziom", :name
    column "Aktywny?", :enabled
    actions
  end
  
  show do
    h1 
    h1 "#{level.language.name} #{level.name}"
    if level.enabled
      h3 "Aktywny"
    else
      h3 "Nieaktywny"
    end
    
    hr
    
    h2 "Grupy"
    
    
    level.groups.each do |group|
      h2 link_to "#{level.language.name} #{level.name}, grupa #{group.name}", admin_group_path(group)
      
    end
    
    
  end

  after_create do
    flash[:success] = "Utworzono nowy poziom"
  end
end
