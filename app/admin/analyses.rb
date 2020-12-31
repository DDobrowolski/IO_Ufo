ActiveAdmin.register Analysis do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :description, :conclusions, :classification, :interpretation, :user_id, :observation_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :conclusions, :classification, :interpretation, :user_id, :observation_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.where(role: "analyst").map {|u| [u.email, u.id]}
      f.input :observation_id, as: :select, collection: Observation.all.map {|o| [o.occurred_at, o.id]}
      f.input :description
      f.input :conclusions
      f.input :classification
      f.input :interpretation
    end
    f.actions
  end
  
end
