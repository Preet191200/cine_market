ActiveAdmin.register Product do
  permit_params :title, :description, :price, :stock_quantity, :category_id, :poster_url, :image

  filter :title
  filter :description
  filter :price
  filter :stock_quantity
  filter :category
  filter :created_at

  index do
    selectable_column
    id_column
    column :title
    column :category
    column :price
    column :stock_quantity
    column :poster_url
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :price
      row :stock_quantity
      row :category
      row :poster_url
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), style: "max-height:200px"
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :poster_url, label: "Poster URL (from TMDB or any image URL)"
      f.input :image, as: :file, label: "Or upload an image file"
    end
    f.actions
  end
end