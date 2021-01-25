ActiveAdmin.register PublicActivity::Activity do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :trackable_type, :trackable_id, :owner_type, :owner_id, :key, :parameters, :recipient_type, :recipient_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:trackable_type, :trackable_id, :owner_type, :owner_id, :key, :parameters, :recipient_type, :recipient_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
