class AddColumnToTableComment < ActiveRecord::Migration
  
  def change
  	add_column :comments, :body, :string
  	add_column :comments, :name, :string
  end
		
  
  
end
