ActiveAdmin.register Level do
  belongs_to :language, optional: true
  permit_params :name, :enabled, :language_id
  menu label: "Poziomy", priority: 3

  
  index do
    selectable_column
    column "Język" do |level|
      link_to Language.find(level.language_id).name, admin_language_path(level.language_id)
    end
    column "Poziom", :name
    column "Aktywny?", :enabled
    actions
  end

  after_create do
    flash[:success] = "Utworzono nowy poziom"
  end
end
