ActiveAdmin.register Lecture do
  belongs_to :group, optional: true
  permit_params :description, :enabled, :hour, :weekday, :group_id
  menu label: "Zajęcia", priority: 5

  filter :group, label: "Grupa", as: :select, member_label: Proc.new { |group| "#{group.level.language.name} #{group.level.name}, grupa #{group.name}" }
  filter :enabled, label: "Aktywne?", collection: [["Tak", "true"], ["Nie", "false"]]
  filter :weekday, label: "Dzień tygodnia", as: :select, collection: ["poniedziałek", "wtorek", "środa", "czwartek", "piątek", "sobota", "niedziela"]
  
  index do
    selectable_column
    column "Grupa" do |lecture|
      h3 "#{lecture.group.level.language.name} #{lecture.group.level.name}, grupa #{lecture.group.name}"
    end
    column "Opis", :description
    column "Aktywne?", :enabled
    column "Godzina" do |lecture|
      h3 lecture.hour.strftime('%H:%M')
    end
    column "Dzień tygodnia", :weekday
    actions
  end
  
  show do
    render 'show'
  end
  
  
  # edit and new form
  form do |f|
    f.inputs "Zajęcia" do
      f.input :group, label: "Grupa", as: :select, member_label: Proc.new { |group| "#{group.level.language.name} #{group.level.name}, grupa #{group.name}" }
      f.input :enabled, label: "Aktywne?"
      f.input :description, label: "Opis"
      f.input :weekday, label: "Dzień tygodnia", as: :select, collection: ["poniedziałek", "wtorek", "środa", "czwartek", "piątek", "sobota", "niedziela"]
      f.input :hour, label: "Godzina"
    end
    f.actions
  end
  
  
end
