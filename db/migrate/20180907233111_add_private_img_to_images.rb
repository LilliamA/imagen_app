class AddPrivateImgToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :private_img, :boolean
  end
end
