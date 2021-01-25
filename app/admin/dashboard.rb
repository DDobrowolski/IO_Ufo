ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Ostatnie aktywności" do
          ul do
            PublicActivity::Activity.last(5).map do |a|
              li link_to("#{a.trackable_type} - #{a.key} - #{a.created_at}", admin_public_activity_activity_path(a))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
  end
end