ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :permit_level

  index do
    selectable_column
    id_column
    column :email
    column "Rola" do |u|
      t(u.role)
    end
    column :permit_level
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :role
  filter :permit_level
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    attributes_table do
      row :email
      row :role do |u|
        t(u.role)
      end
      row :permit_level
      row :created_at
      row :modified_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :role, as: :select, collection: User.get_available_roles.map{ |r| [t(r), r] }
      f.input :permit_level
    end
    f.actions
  end

end
