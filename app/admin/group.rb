ActiveAdmin.register Group do
  permit_params :name, :enabled, :capacity, :level_id
  menu label: "Grupy"
  menu priority: 4
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

  before_create do |group|
    level = Level.find(params[:group][:level_id])
    
    group.name = "#{level.name}, grupa #{params[:group][:name]}"
  end

  after_create do
    flash[:success] = "Utworzono nową grupę"
  end
end
