ActiveAdmin.register Group do
  belongs_to :level, optional: true
  permit_params :name, :enabled, :capacity, :level_id
  menu label: "Grupy", priority: 4

  filter :level, label: "Poziom", member_label: Proc.new { |level| "#{level.language.name} #{level.name}" }
  filter :enabled, label: "Aktywne?", collection: [["Tak", "true"], ["Nie", "false"]]
  filter :capacity, label: "Ilość miejsc"
  
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
    column "Aktywne?", :enabled
    column "Ilość miejsc", :capacity
    column "Zapisani kursanci (zapłacili)" do |group|
      h3 "#{group.students.count} (#{group.students_who_paid.count})"
    end
    actions
  end
  
  show do
    render 'show'
  end
  
  # edit and new form
  form do |f|
    f.inputs "Grupa językowa" do
      f.input :level, label: "Poziom", member_label: Proc.new { |level| "#{level.language.name} #{level.name}" }
      f.input :name, label: "Nazwa"
      f.input :enabled, label: "Aktywne?"
      f.input :capacity, label: "Ilość miejsc"
    end
    f.actions
  end

  after_create do
    flash[:success] = "Utworzono nową grupę"
  end
end
