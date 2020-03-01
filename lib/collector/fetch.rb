require 'http'

class Fetch
    def call()
        return puts(get_json.size)
    end
    private
    def get_json
        #TODO: поработать с директориями
        puts "Get json..."
        JSON.parse(File.read('./lib/collector/samples/api_response.json'))
    end
end


