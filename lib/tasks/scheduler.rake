

desc "This task is called by the Heroku Schedular add-on to get tcg pricing data"

task :get_tcg_prices => :environment do

     MagicCard.all.each do |x|
         url = URI("http://api.tcgplayer.com/pricing/product/" + x['productID'].to_s )
         http = Net::HTTP.new(url.host, url.port)
         request = Net::HTTP::Get.new(url)
         request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
         response = http.request(request)
         data = JSON.parse(response.body)
         data['results'].each do |y|
             if y["subTypeName"] == "Normal"
                 c = MagicCard.find_by(productID: y['productId'])
                 c.update_attribute(:tcgPrice,  y["midPrice"])
             elsif y["subTypeName"] == "Foil"
                 if MagicCard.where(productID: -(y['productId'])).exists?
                     c = MagicCard.find_by(productID: -(y['productId']))
                     c.update_attribute(:tcgPrice,  y["midPrice"])
                 #else
                  #   MagicCard.create(:productID => -(y['productId']), :tcgPrice => y["midPrice"], :isFoil => true, :name => x['name'], :set => x['set'] )

                 end
             end
         end
         sleep 0.5
     
     end
end

desc "This task is called by the Heroku Schedular add-on to get CK pricing data"

task :get_prices => :environment do
    HardWorker.new.perform
end