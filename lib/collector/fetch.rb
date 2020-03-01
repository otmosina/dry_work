require 'http'

class Fetch
    def call()

        get_json.each do |item|
            #TODO: унести валидацию в модель
            #! почему то не проходим их регексп, какая-то хрень
            if !item['referrerName'].match(/\A[A-z0-9]{8}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{12}\z/)
                new_visit = Visit.create(
                    evid: item['referrerName'],
                    vendor_site_id: item['idSite'],
                    vendor_visit_id: item['idVisit'],
                    visit_ip: item['visitIp'],
                    vendor_visitor_id: item['visitoriId']            
                )
            end
            item["actionDetails"].each do |action_detail|
                Pageview.create(
                    visit_id: new_visit.id,
                    url: action_detail['url'] ,
                    title: action_detail['pagetitle'],
                    time_spent: action_detail['timespent'],
                    timestamp: action_detail['timestamp']
                )
            end

        end

        puts("Inserting Visits #{Visit.all.size}")
        puts("done!")

        puts("Inserting Pageview #{Pageview.all.size}")
        puts("done!")        
        return "Done"
    end
    private
    def get_json
        #TODO: поработать с директориями
        puts "Get json..."
        JSON.parse(File.read('./lib/collector/samples/api_response.json'))
    end
end


