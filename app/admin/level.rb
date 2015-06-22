ActiveAdmin.register Level do
  belongs_to :language, optional: true
  permit_params :name, :enabled, :language_id
  menu label: "Poziomy", priority: 3

  filter :language_id, label: "Język", as: :select, collection: ->{ Language.all }
  filter :enabled, label: "Aktywne?", collection: [["Tak", "true"], ["Nie", "false"]]
  
  index do
    selectable_column
    column "Język", sortable: :level do |level|
      link_to Language.find(level.language_id).name, admin_language_path(level.language_id)
    end
    column "Poziom", :name
    column "Aktywne?", :enabled
    column "Zapisani kursanci (zapłacili)" do |level|
      h3 "#{level.students.count} (#{level.students_who_paid.count})"
    end
    column "Zapłacono" do |level|
      h3 "#{level.amount_paid} / #{level.amount_to_pay}"
    end
    actions
  end
  
  show do
    render 'show'
  end

  form do |f|
    f.inputs "Poziom" do
      f.input :language, label: "Język"
      f.input :name, label: "Poziom", as: :select, collection: ["A1", "A2", "B1", "B2", "C1", "C2"]
      f.input :enabled, label: "Aktywne?"
    end
    f.actions
  end
  
  
  after_create do
    flash[:success] = "Utworzono nowy poziom"
  end
end
