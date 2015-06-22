ActiveAdmin.register Language do
  permit_params :name, :enabled
  menu label: "Języki", priority: 2

  index do
    selectable_column
    
    column "Nazwa" do |language|
      link_to language.name, admin_language_path(language.id)
    end
    column "Aktywny?", :enabled
    actions
  end
  
  show do
    
    h1 language.name
    if language.enabled
      h3 "Aktywny"
    else
      h3 "Nieaktywny"
    end
    
    hr
    
    h2 "Poziomy"
    
    
    language.levels.each do |level|
      h2 link_to "#{language.name} #{level.name}", admin_level_path(level)
      
    end
    
    
  end
  
  
  after_create do
    flash[:success] = "Utworzono nowy język"
  end

end
