class Entries 
    attr_accessor :items
    def self.search(search_query)
        url = "https://online.equipe.com/api/v1/searches?qc=Start&q="
        
        
        common_params =  {
            qc: "Start",
            q: search_query
        }
        items = []
        page = 1

        loop do #Loops all pages
            uri = URI(url)
            uri.query = URI.encode_www_form(common_params.merge(page: page))

            res = Net::HTTP.get_response(uri)

            if res.is_a?(Net::HTTPSuccess)
                page_items = JSON.parse(res.body)
                items.concat(page_items)

                #Check if there are more pages
                break unless page_items.any?

                page += 1

            else
            @error_message = "API request failed with response code: #{res.code}"
            break #exit loop on error
            end
        end

        entries = new 
        entries.items = items
        
        return entries
        
    end

    def riders

        return @items.map{ |item| item["rider_name"]}.uniq
    end

    def horses

        return @items.map{ |item| item["horse_name"]}.uniq

    end

    def qualifications
        return  @items.filter { |item| item['meeting_class_name'].include?('Medelsvår B:1') && item['result_preview'].to_f > 64 }
    end

    def filteredByRider(selectedRider)
        return @items.filter{ |item| item['rider_name'] == selectedRider}
    end


 

        

end
