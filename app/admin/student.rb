ActiveAdmin.register Student do
  belongs_to :group, optional: true
  permit_params :firstname, :lastname, :email, :phone, :amount, :paid, :amount_paid, :group_id, :description
  menu label: "Kursanci", priority: 6


end
