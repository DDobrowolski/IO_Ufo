ActiveAdmin.register Observation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :occurred_at, :gps, :description, :directory_name, :permit_role, observer_ids: []
  #
  # or
  #
  # permit_params do
  permitted = [:occurred_at, :gps, :description, :directory_name, :permit_role, :observer_ids]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      permitted.map do |p|
        if p == :observer_ids
          table_for observation.observers do
            column "Obserwatorzy" do |o|
              link_to "#{o.first_name} #{o.last_name}", admin_observer_path(o)
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
        if p == :observer_ids
          f.input p, label: "Obserwatorzy", as: :select, input_html: { multiple: true }, collection: Observer.all.map{ |r| ["#{r.first_name} #{r.last_name}", r.id] }
        else
          f.input p
        end
      end
    end
    actions
  end
  
end
