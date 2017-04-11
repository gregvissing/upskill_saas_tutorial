class AddPlanToUser < ActiveRecord::Migration[5.0]
    def change
        # add column to users table to link tables 
        add_column :users, :plan_id, :integer
    end
end
