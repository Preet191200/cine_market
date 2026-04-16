ActiveAdmin.register Province do
  permit_params :name, :gst_rate, :pst_rate, :hst_rate

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column "GST" do |p|
      number_to_percentage(p.gst_rate * 100, precision: 1)
    end
    column "PST" do |p|
      number_to_percentage(p.pst_rate * 100, precision: 3)
    end
    column "HST" do |p|
      number_to_percentage(p.hst_rate * 100, precision: 1)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :gst_rate, label: "GST Rate (e.g. 0.05 for 5%)", min: 0
      f.input :pst_rate, label: "PST Rate (e.g. 0.07 for 7%)", min: 0
      f.input :hst_rate, label: "HST Rate (e.g. 0.13 for 13%)", min: 0
    end
    f.actions
  end
end
