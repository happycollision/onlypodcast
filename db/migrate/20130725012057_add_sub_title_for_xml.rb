class AddSubTitleForXml < ActiveRecord::Migration
  def change
  	add_column :episodes, :xml_subtitle, :string
  end
end
