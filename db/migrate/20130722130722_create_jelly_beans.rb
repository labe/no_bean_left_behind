class CreateJellyBeans < ActiveRecord::Migration
  def change
    create_table 			:jelly_beans do |t|
    	t.string				:flavor

      t.timestamps
    end
  end
end
