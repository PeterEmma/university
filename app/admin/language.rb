ActiveAdmin.register Language do
  permit_params :name, :enabled
  menu label: "Języki", priority: 2

  filter :name, label: "Język", as: :select, collection: ->{ Language.all }
  filter :enabled, label: "Aktywne?", collection: [["Tak", "true"], ["Nie", "false"]]
  
  index do
    selectable_column
    column "Nazwa" do |language|
      link_to language.name, admin_language_path(language.id)
    end
    column "Aktywne?", :enabled
    column "Zapisani kursanci (zapłacili)" do |language|
      h3 "#{language.students.count} (#{language.students_who_paid.count})"
    end
    column "Zapłacono" do |language|
      h3 "#{language.amount_paid} / #{language.amount_to_pay}"
    end
    actions
  end
  
  show do
    render 'show'
  end
  
  # edit and new form
  form do |f|
    f.inputs "Język" do
      f.input :name, label: "Język"
      f.input :enabled, label: "Aktywne?"
    end
    f.actions
  end
  
  
  after_create do
    flash[:success] = "Utworzono nowy język"
  end

end
