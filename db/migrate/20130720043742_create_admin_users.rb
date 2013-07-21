class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :username
      t.string :hashed_password

      t.timestamps
    end
  end

  def down
    drop_table :admin_users
  end
end
