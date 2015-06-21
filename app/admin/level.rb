ActiveAdmin.register Level do
  permit_params :name, :enabled, :language_id
  menu label: "Poziomy"
  menu priority: 3
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
  
  before_create do |level|
    language = Language.find(params[:level][:language_id])
    level.name = "#{language.name} #{params[:level][:name]}"
  end

  after_create do
    flash[:success] = "Utworzono nowy poziom"
  end
end
