ActiveAdmin.register User do
  permit_params :email, :password

  show do
    attributes_table do
      row :email
    end
  end

  index do
    selectable_column
    id_column
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
    end
    actions
  end
end
