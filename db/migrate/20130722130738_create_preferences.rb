class CreatePreferences < ActiveRecord::Migration
  def change
    create_table 		:preferences do |t|
    	t.belongs_to	:user
    	t.belongs_to 	:jelly_bean
    	t.integer			:value, :default => 0
    	t.integer			:quantity, :default => 0

      t.timestamps
    end
  end
end
