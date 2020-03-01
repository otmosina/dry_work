require 'dry/system/container'
require 'dry/system/components'

class Notifier < Dry::System::Container
    use :logging
    use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
    use :monitoring #maybe later use
    configure do |config|
      #config.root = /root/app/dir
      config.auto_register = 'lib'
    end
    load_paths!('lib', 'system')
end


class Migrater < Dry::System::Container
  #use :logging
  #use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
  #use :monitoring #maybe later use
  configure do |config|
    config.auto_register << 'db'
  end
  load_paths!('db')
end

class Collector < Dry::System::Container
  use :logging
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
  use :monitoring #maybe later use  
  configure do |config|
    #config.root = /root/app/dir
    #TODO(otmosina):точно понять что значит auto_register
    config.auto_register = 'lib/collector'
  end
  #TODO(otmosina):точно понять что значит load_paths!
  load_paths!('lib', 'system')
end

