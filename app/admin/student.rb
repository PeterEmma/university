ActiveAdmin.register Student do
  belongs_to :group, optional: true
  permit_params :firstname, :lastname, :email, :phone, :amount, :paid, :amount_paid, :group_id, :description
  menu label: "Kursanci", priority: 6

  filter :firstname, label: "Imię"
  filter :lastname, label: "Nazwisko"
  filter :email
  filter :phone, label: "Telefon"
  filter :amount, label: "Do zapłaty"
  filter :paid, label: "Zapłacone?"
  
end
