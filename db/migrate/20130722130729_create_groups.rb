class CreateGroups < ActiveRecord::Migration
  def change
    create_table 			:groups do |t|
    	t.belongs_to		:creator
    	t.string				:name

      t.timestamps
    end
  end
end
