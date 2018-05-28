desc 'create cards'

task :create_cards => :environment do
    @cardHash = Hash.new
    MagicSet.all.each do |x|
        url = URI("http://api.tcgplayer.com/catalog/products?categoryId=1&getExtendedFields=true&productTypes=Cards&groupId=" + x['tcgID'].to_s)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Get.new(url)
        request['Authorization'] = "Bearer " + ENV['API_KEY']
        response = http.request(request)
        data = JSON.parse(response.body)
        unless data['success'] == false
            totalItems= data['totalItems']
            i = 0
            num = (data['totalItems']/100).ceil
            while i < num+1 do
                url = URI("http://api.tcgplayer.com/catalog/products?categoryId=1&productTypes=Cards&limit=100&getExtendedFields=true&groupId=" + x['tcgID'].to_s + '&offset=' + (i *100).to_s )
                puts url
                http = Net::HTTP.new(url.host, url.port)
                request = Net::HTTP::Get.new(url)
                request['Authorization'] = "Bearer " + ENV['API_KEY']
                response = http.request(request)
                data = JSON.parse(response.body)
                data['results'].each do |y|
                    @cardHash[y["productId"]] = {"name" => y["productName"], "tcgPrice"=> 0,  "ckPrice" => 0, "isFoil"=> nil, "set"=> x["sdkID"],  "spread" => nil, "rarity"=> y['extendedData'][0]['value']}
                    puts @cardHash[y["productId"]]
                end
                sleep 1
                i+=1
            end
        end
    end


    @cardHash.delete_if{|k,v|  v['rarity'] == "T" || v['rarity'] == "L" || v['rarity'] == "U" || v['rarity'] == "C" ||  v['rarity'] == "P" ||  v['rarity'] == "S"  }

    @cardHash.each  { |k,v|  MagicCard.create(:productID => k, :name => v['name'], :tcgPrice => nil, :ckPrice => nil, :isFoil => false, :set => v['set'], :spread => nil ) }

end

