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
    h1 "#{group.level.language.name} #{group.level.name}, grupa #{group.name}"
    if group.enabled
      h3 "Aktywne"
    else
      h3 "Nieaktywne"
    end
    
    hr
    h2 "Zajęcia"
    group.lectures.each do |lecture|
      h2 link_to "#{lecture.weekday}, #{lecture.hour.strftime('%H:%M')}", admin_lecture_path(lecture)
    end
    
    hr
    h2 "Zapisani kursanci (#{group.students.count})"
    group.students.each do |student|
      h2 link_to "#{student.firstname} #{student.lastname}, #{student.email}, #{student.phone}", admin_student_path(student)
    end
  end
  
  # edit and new form
  form do |f|
    f.inputs "Grupa językowa" do
      f.input :name, label: "Nazwa"
      f.input :enabled, label: "Aktywne?"
      f.input :capacity, label: "Ilość miejsc"
      f.input :level, label: "Poziom", member_label: Proc.new { |level| "#{level.language.name} #{level.name}" }
    end
    f.actions
  end

  after_create do
    flash[:success] = "Utworzono nową grupę"
  end
end
