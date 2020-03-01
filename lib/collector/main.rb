require 'import'

class Main
    include Import[ 'collector.fetch' ]

    def call()
        fetch.call()
    end

end