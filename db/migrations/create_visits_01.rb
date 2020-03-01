class CreateVisitsTable < ActiveRecord::Migration[5.2]
    def up
      unless ActiveRecord::Base.connection.table_exists?(:visits)
        create_table :visits do |t|
            t.string "evid"
            t.string "vendor_site_id"
            t.string "vendor_visit_id"
            t.string "visit_ip"
            t.string "vendor_visitor_id"
            #table.timestamps
        end
      end
    end
  
    def down
      if ActiveRecord::Base.connection.table_exists?(:visits)
        drop_table :visits
      end
    end
  end
  