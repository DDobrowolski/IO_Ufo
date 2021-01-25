ActiveAdmin.register Observer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :last_name, :first_name, :nick, :address, :contact, :photo, :description, observation_ids: []
  #
  # or
  #
  # permit_params do
   permitted = [:last_name, :first_name, :nick, :address, :contact, :photo, :description, :observation_ids]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  show do
    attributes_table do
      permitted.map do |p|
        if p == :observation_ids
          table_for observer.observations do
            column "Obserwacje" do |o|
              link_to "#{o.occurred_at} - #{o.directory_name}", admin_observation_path(o)
            end
          end
        else
          row p
        end
      end
    end
  end

  form do |f|
    f.inputs do
      permitted.map do |p|
        if p == :observation_ids
          f.input p, label: "Obserwacje", as: :select, input_html: { multiple: true }, collection: Observation.all.map{ |r| ["#{r.occurred_at}", r.id] }
        else
          f.input p
        end
      end
    end
    actions
  end

end
