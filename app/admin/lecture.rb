ActiveAdmin.register Lecture do
  permit_params :description, :enabled, :hour, :weekday, :group_id
  menu label: "Zajęcia", priority: 5

  filter :group, label: "Grupa"
  filter :enabled, label: "Aktywne?"
  
  index do
    selectable_column
    
    column "Opis", :description
    column "Aktywne?", :enabled
    column "Godzina" do |lecture|
      h3 lecture.hour.strftime('%H:%M')
    end
    column "Dzień tygodnia", :weekday
    actions
  end
  
  show do
    h1 "Zajęcia dla grupy #{lecture.group.name}"
    if lecture.enabled
      h3 "Aktywny"
    else
      h3 "Nieaktywny"
    end
    
    hr
    h2 lecture.weekday
    h2 lecture.pretty_hour
    h2 link_to "Należą do: #{lecture.group.level.language.name} #{lecture.group.level.name}, grupa #{lecture.group.name}", admin_group_path(lecture.group)
  end
end
