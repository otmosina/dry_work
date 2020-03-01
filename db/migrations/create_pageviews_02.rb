class CreatePageviewsTable < ActiveRecord::Migration[5.2]
    def up
      unless ActiveRecord::Base.connection.table_exists?(:pageviews)
        create_table :pageviews do |t|
            t.bigint "visit_id"
            t.string "title"
            t.string "position"
            t.text "url"
            t.string "time_spent"
            t.decimal "timestamp", precision: 14, scale: 3
            #table.timestamps
        end
      end
    end
  
    def down
      if ActiveRecord::Base.connection.table_exists?(:pageviews)
        drop_table :pageviews
      end
    end
  end
  