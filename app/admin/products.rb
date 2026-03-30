ActiveAdmin.register Product do
  permit_params :title, :description, :price, :stock_quantity, :category_id, :poster_url, :image

  index do
    selectable_column
    id_column
    column :title
    column :category
    column :price
    column :stock_quantity
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :poster_url, label: "Poster URL (from TMDB or any image URL)"
      f.input :image, as: :file, label: "Or upload an image"
    end
    f.actions
  end
end