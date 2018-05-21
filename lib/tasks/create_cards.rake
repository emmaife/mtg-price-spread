desc 'create cards'

task :create_cards => :environment do
    @cardHash = Hash.new
    MagicSet.all.each do |x|
        url = URI("http://api.tcgplayer.com/catalog/products?categoryId=1&getExtendedFields=true&productTypes=Cards&groupId=" + x['tcgID'].to_s)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Get.new(url)
        request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
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
                request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
                response = http.request(request)
                data = JSON.parse(response.body)
                data['results'].each do |y|
                    @cardHash[y["productId"]] = {"name" => y["productName"], "tcgPrice"=> 0,  "ckPrice" => 0, "isFoil"=> nil, "set"=> x["sdkID"],  "spread" => nil, "rarity"=> y['extendedData'][0]['value'], "set_id" => x['id']}
                    puts @cardHash[y["productId"]]
                end
                sleep 1
                i+=1
            end
        end
    end


    @cardHash.delete_if{|k,v|  v['rarity'] == "T" || v['rarity'] == "L" || v['rarity'] == "U" || v['rarity'] == "C" ||  v['rarity'] == "P" ||  v['rarity'] == "S"  }

    @cardHash.each  { |k,v|  MagicCard.create(:productID => k, :name => v['name'], :tcgPrice => nil, :ckPrice => nil, :isFoil => false, :set => v['set'], :spread => nil, :set_id=> v['set_id'] ) }

end

