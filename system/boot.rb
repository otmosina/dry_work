require 'bundler/setup'
require_relative 'container'
require_relative 'import'


require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'localhost',
  username: 'root',
  password: 'user',
  database: 'shastic'
)

class Name < ActiveRecord::Base
end
puts(Name.first.firstname)


#Notifier.finalize!
#Migrater.finalize!
Collector.finalize!