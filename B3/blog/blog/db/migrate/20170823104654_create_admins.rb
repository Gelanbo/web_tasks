class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :adminname
      t.string :password

      t.timestamps
    end
  end
end
