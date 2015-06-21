ActiveAdmin.register Language do
  permit_params :name, :enabled
  menu label: "Języki"
  menu priority: 2
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
  after_create do
    flash[:success] = "Utworzono nowy język"
  end

end
