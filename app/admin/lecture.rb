ActiveAdmin.register Lecture do
  permit_params :description, :enabled, :hour, :weekday, :group_id
  menu label: "Zajęcia"
  menu priority: 5
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
