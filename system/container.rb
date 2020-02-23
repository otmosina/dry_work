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

