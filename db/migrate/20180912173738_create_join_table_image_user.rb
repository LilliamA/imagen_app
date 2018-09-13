class CreateJoinTableImageUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :images, :users do |t|
      #add_reference :images, :user, foreign_key: true
      t.index [:image_id, :user_id]
      t.index [:user_id, :image_id]
    end
  end
end

