class AddUserIdToImages < ActiveRecord::Migration[5.1]
  #rails g migration add_user_id_to_images user:references
  def change
    add_reference :images, :user, foreign_key: true
  end
end
