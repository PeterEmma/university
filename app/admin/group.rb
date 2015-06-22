ActiveAdmin.register Group do
  belongs_to :level, optional: true
  permit_params :name, :enabled, :capacity, :level_id
  menu label: "Grupy", priority: 4

  index do
    selectable_column
    
    column "Język" do |group|
      level = Level.find(group.level_id)
      language = Language.find(level.language_id)
      link_to language.name, admin_language_path(language)
    end
    
    column "Poziom" do |group|
      level = Level.find(group.level_id)
      link_to level.name, admin_level_path(level)
    end
    
    column "Grupa" do |group|
      link_to group.name, admin_group_path(group)
    end
    
    column "Aktywna?", :enabled
    column "Ilość miejsc", :capacity
    column "Zapisani kursanci"
    actions
  end
  
  show do
    h1 "#{group.level.language.name} #{group.level.name}, grupa #{group.name}"
    if group.enabled
      h3 "Aktywny"
    else
      h3 "Nieaktywny"
    end
    
    hr
    
    h2 "Zajęcia"
    
    
    group.lectures.each do |lecture|
      h2 link_to "#{lecture.weekday}, #{lecture.hour.strftime('%H:%M')}", admin_lecture_path(lecture)
    end
    
  end
  
  
  after_create do
    flash[:success] = "Utworzono nową grupę"
  end
end
