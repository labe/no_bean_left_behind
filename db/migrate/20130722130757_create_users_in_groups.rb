class CreateUsersInGroups < ActiveRecord::Migration
  def change
    create_table 		:users_in_groups do |t|
    	t.belongs_to	:user
    	t.belongs_to 	:group

      t.timestamps
    end
  end
end
