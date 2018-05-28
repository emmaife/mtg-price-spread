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
            request['Authorization'] = "Bearer " + ENV['API_KEY']
            response = http.request(request)
            data = JSON.parse(response.body)
            data['results'].each do |y|
               if y["subTypeName"] == "Normal"
                    c = MagicCard.find_by(productID: y['productId'])
                    puts "NORMAL"
                    puts y["midPrice"]
                    puts c['name']
                elsif y["subTypeName"] == "Foil"
                    puts "FOIL"
                    if MagicCard.where(productID: -(y['productId'])).exists?
                        c = MagicCard.find_by(productID: -(y['productId']))
                       puts  "EXISTS"
                        puts c['productID']
                        puts c['name']
                    else
                        puts "NOT EXISTS"
                        puts -(y['productId']) 
                        puts x['name']
                    end
                end
            end
            str = ""
        end
    end
end