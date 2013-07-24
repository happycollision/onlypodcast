class ChangeFileAndArtLocationsToNames < ActiveRecord::Migration
  def up
  	rename_column :episodes, :file_location, :file_name
  	rename_column :episodes, :art_location, :art_name
  end

  def down
  	rename_column :episodes, :file_name, :file_location
  	rename_column :episodes, :art_name, :art_location
  end
end
