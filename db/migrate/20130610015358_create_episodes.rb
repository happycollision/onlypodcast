class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :number
      t.datetime :date
      t.text :show_notes
      t.string :file_location
      t.integer :file_size
      t.integer :duration
      t.string :art_location
      t.text :description
      t.string :keywords
      t.integer :podcast_id

      t.timestamps
    end
    add_index(:episodes,:podcast_id)
  end
end
