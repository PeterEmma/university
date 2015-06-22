ActiveAdmin.register Student do
  belongs_to :group, optional: true
  permit_params :firstname, :lastname, :email, :phone, :amount, :paid, :amount_paid, :group_id, :description
  menu label: "Kursanci", priority: 6

  filter :group, label: "Grupa", as: :select, member_label: Proc.new { |group| "#{group.level.language.name} #{group.level.name}, grupa #{group.name}" }
  filter :firstname, label: "Imię"
  filter :lastname, label: "Nazwisko"
  filter :email
  filter :phone, label: "Telefon"
  filter :amount, label: "Do zapłaty"
  filter :paid, label: "Zapłacone?", collection: [["Tak", "true"], ["Nie", "false"]]

  index do
    selectable_column
    column "Grupa" do |student|
      h3 link_to "#{student.group.level.language.name} #{student.group.level.name}, grupa #{student.group.name}", admin_group_path(student.group)
    end
    column "Imię", :firstname
    column "Nazwisko", :lastname
    column :email
    column "Telefon", :phone
    column "Do zapłaty", :amount
    column "Zapłacone?", :paid
    column "Data rejestracji", :created_at
    column "Opis", :description
    actions
  end
    
  
  form do |f|
    f.inputs "Kursant" do
      f.input :group, label: "Grupa", as: :select, member_label: Proc.new { |group| "#{group.level.language.name} #{group.level.name}, grupa #{group.name}" }
      f.input :firstname, label: "Imię"
      f.input :lastname, label: "Nazwisko"
      f.input :email
      f.input :phone, label: "Telefon"
      f.input :amount, label: "Do zapłaty"
      f.input :paid, label: "Zapłacone?"
      f.input :amount_paid, label: "Zapłacono"
      f.input :description, label: "Opis"
    end
    f.actions
  end
  
  
end
