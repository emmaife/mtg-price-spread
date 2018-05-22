desc "test get prices task"

task :test_prices => :environment do

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
                    if MagicCard.where(productID: y['productId']).exists?
                        c = MagicCard.find_by(productID: y['productId'])
                        puts 'yes'
                    end
                elsif y["subTypeName"] == "Foil"
                    if MagicCard.where(productID: -(y['productId'])).exists?
                        c = MagicCard.find_by(productID: -(y['productId']))
                        puts c
                    else
                        puts  -(y['productId'])
                        puts x['name']
                        puts x['set']

                    end
                end
            end
            str = ""
        end
    end
end