class AddUserIdToPictures < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :pictures, :users
  end
end
