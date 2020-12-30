ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column "Rola" do |u|
      t(u.role)
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :role, label: 'Rola'
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :role, label: 'Rola', :as => :select, :collection => User.get_available_roles.map{|r| ["#{t(r)}", r]}
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
