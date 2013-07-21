class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :personalities do |t|
      t.string :first
      t.string :last
      t.text :bio
      t.string :image
      t.string :gravatar_email
      t.boolean :use_gravatar_bio
      t.boolean :use_gravatar_image

      t.timestamps
    end
  end
end
