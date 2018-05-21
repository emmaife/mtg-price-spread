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




desc "This task is called by the Heroku Schedular add-on to get pricing data"

task :get_prices => :environment do

 	str = ""
    MagicCard.all.each do |x|
        str = str + x['productID'].to_s + ','
        if ERB::Util.url_encode(str).length >= 1500
            str = str[0...-1]
            url = URI("http://api.tcgplayer.com/pricing/product/" +  ERB::Util.url_encode(str))
            http = Net::HTTP.new(url.host, url.port)
            request = Net::HTTP::Get.new(url)
            request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
            response = http.request(request)
            data = JSON.parse(response.body)
            data['results'].each do |y|
                if y["subTypeName"] == "Normal"
                    c = MagicCard.find_by(productID: y['productId'])
                    c.update_attribute(:tcgPrice,  y["midPrice"])
                elsif x["subTypeName"] == "Foil"
                    if MagicCard.where(productID: -(x['productId'])).exists?
                        c = MagicCard.find_by(productID: -(y['productId']))
                        c.update_attribute(:tcgPrice,  y["midPrice"])
                    else
                        MagicCard.create(:productID => -(y['productId']), :tcgPrice => y["midPrice"], :isFoil => true, :name => x['name'], :set => x['set'] )

                    end
                end
            end
            str = ""
        end
    end

    MagicSet.all.each do |x|
        ckSetCode = x['ckID']
        scraper = Mechanize.new
        scraper.history_added = Proc.new { sleep 1.0 }
        sleep 2

        scraper.get('https://www.cardkingdom.com/purchasing/mtg_singles/?filter[sort]=name&filter[search]=mtg_advanced&filter[ipp]=500&filter[rarity][0]=M&filter[rarity][1]=R&filter[category_id]=' + ckSetCode.to_s) do |search_page|
            form = search_page.form_with(:id => 'search')
            result_page = form.submit
            raw_results = result_page.search('div.itemContentWrapper')
            raw_results.each do |result|
                unless result.css('span.sellDollarAmount')[0].nil?
                    newCardName =  result.css('span.productDetailTitle').text.strip
                    foil =  result.css('div.foil').text.strip
                    price = result.css('span.sellDollarAmount')[0].text.strip + '.' + result.css('span.sellCentsAmount')[0].text.strip
                    price = price.to_f
                    if foil != "FOIL"
                        m = MagicCard.find_by(name: newCardName, isFoil: false, set: x['tcgID'])
                        unless m.nil?
                            m.update_attribute(:ckPrice, price )
                            unless m["tcgPrice"].nil?
                                spread =  ((1 - (price/m["tcgPrice"]))*100)
                                m.update_attribute(:spread, spread  ) 
                             end
                         end
                  
                    else
                        f = MagicCard.find_by(name: newCardName, isFoil: true, set: x['tcgID'])
                        unless f.nil?
                            f.update_attribute(:ckPrice, price ) 
                            unless f["tcgPrice"].nil?
                                spread =  ((1 - (price/f["tcgPrice"]))*100)
                                f.update_attribute(:spread, spread  ) 
                            end
                        end
                    end
                end
            end
            sleep 1
        end
    end
     
end