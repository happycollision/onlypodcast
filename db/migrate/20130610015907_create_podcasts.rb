class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :slug
      t.string :url
      t.text :description
      t.string :keywords
      t.boolean :explicit
      t.string :category
      t.string :subcategories
      t.string :author

      t.timestamps
    end
  end
end
