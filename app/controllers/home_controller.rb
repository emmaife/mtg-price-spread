class HomeController < ApplicationController
	require 'open-uri'
	require 'mechanize'
	require 'uri'
	require 'net/http'
	require 'cgi'

	helper_method :get_other_prices
	helper_method :get_tcg_price
	helper_method :get_cf_prices
	helper_method :get_ck_prices



	def index
		@sets = MagicSet.all
  		if params[:q]
  			@cards = MTG::Card.where(name: params[:q]).all
  		else

    		@cards = MTG::Card.where(page: 1).where(pageSize: 20).all
  		end
	end

	def search
		@cardHash = Hash.new
		@priceArr = Array.new
		@results = Array.new
		cardNames = Array.new
		if params[:q] != ""
    		@cards = MTG::Card.where(name: params[:q]).all
    		@cards.each do |x|
    			
    				y = MagicSet.find_by(sdkID: x.set)
    				unless y.nil?
    					cardNames << [x.name, x.set, y.tcgID]
    				end
    			
    		end
    		cardNames.each do |x|
    			puts '======'
    			puts x
    			url = URI("http://api.tcgplayer.com/catalog/products?categoryId=1&groupId=" + x[2].to_s + "&productName=" +  ERB::Util.url_encode(x[0]) + "&getExtendedFields=true")
    			http = Net::HTTP.new(url.host, url.port)
				request = Net::HTTP::Get.new(url)
				request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
				response = http.request(request)
				data = JSON.parse(response.body)
				data['results'].each do |y|
					puts x[1] 
					puts '------>'
					puts y["productId"] 
					puts y['productName']
						@cardHash[y["productId"]] = {"name" => y["productName"], "price"=> 0, "set" => x[1], "foilPrice" => nil, "ckPrice" => 0, "ckFoil" => nil, "spread" => nil }

				end
    		end
    		str = ""
    		@cardHash.keys.each do |x|
    			str = str + x.to_s + ","
    		end
    		str = str[0...-1]
    		url  = URI("http://api.tcgplayer.com/pricing/product/" +  ERB::Util.url_encode(str) )
			http = Net::HTTP.new(url.host, url.port)
			request = Net::HTTP::Get.new(url)
			request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
			response = http.request(request)
			data = JSON.parse(response.body)
			puts data['results']

			data['results'].each do |x|
				if x["subTypeName"] == "Normal"
						@cardHash[x["productId"]]["price"] = x["midPrice"]
				elsif x["subTypeName"] == "Foil"
					@cardHash[x["productId"]]["foilPrice"] = x["midPrice"]
				end
					
			end


    	
		else
			@cards = Array.new
			@cardHash=Hash.new
			params[:set].each do |k,v|
				tcgSet = MagicSet.find(k)
				tcgSetID =  tcgSet.tcgID
				ckSetID =MagicSet.find(k).ckID
				sdkID = MagicSet.find(k).sdkID
				(@cards << MTG::Card.where(set: sdkID).all).flatten!

				#puts params[:set].length
				url = URI("http://api.tcgplayer.com/catalog/products?categoryId=1&productTypes=Cards&groupId=" + tcgSetID.to_s)
				http = Net::HTTP.new(url.host, url.port)
				request = Net::HTTP::Get.new(url)
				request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
				response = http.request(request)
				data = JSON.parse(response.body)

				# get total items to paginate (limit = 100)
				totalItems = data['totalItems']
				puts  (data['totalItems']/100).ceil
				i = 0
				num = (data['totalItems']/100).ceil
				while i < num+1 do

					url = URI("http://api.tcgplayer.com/catalog/products?categoryId=1&productTypes=Cards&limit=100&getExtendedFields=true&groupId=" + tcgSetID.to_s + '&offset=' + (i *100).to_s )
					puts url
					http = Net::HTTP.new(url.host, url.port)
					request = Net::HTTP::Get.new(url)
					request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
					response = http.request(request)
					data = JSON.parse(response.body)

					data['results'].each do |x|
						@cardHash[x["productId"]] = {"name" => x["productName"], "price"=> 0, "set"=> sdkID, "foilPrice" => nil, "ckPrice" => 0, "ckFoil" => nil, "spread" => nil}

					end
					@cardHash

					i+=1
				end


				#url = URI("http://api.tcgplayer.com/pricing/group/" + tcgSetID.to_s)
				str = ""
	    		@cardHash.keys.each do |x|
	    			str = str + x.to_s + ","
	    		end
	    		str = str[0...-1]
	    		url  = URI("http://api.tcgplayer.com/pricing/product/" +  ERB::Util.url_encode(str) )
				http = Net::HTTP.new(url.host, url.port)
				request = Net::HTTP::Get.new(url)
				request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
				response = http.request(request)
				data = JSON.parse(response.body)

				data['results'].each do |x|
					if x["subTypeName"] == "Normal"
						@cardHash[x["productId"]]["price"] = x["midPrice"]
					elsif x["subTypeName"] == "Foil"
						@cardHash[x["productId"]]["foilPrice"] = x["midPrice"]
					end
					
				end
			end
		end
		@foilHash = Hash.new()
		spread = nil
		@cardHash.each do |key, val|
			setCode = val["set"]
			ckCode = MagicSet.find_by(sdkID: setCode)["ckID"]
			cardName = val["name"]
			scraper = Mechanize.new
			scraper.history_added = Proc.new { sleep 1.0 }
			
			scraper.get('https://www.cardkingdom.com/purchasing/mtg_singles?filter[sort]=price_desc&filter[search]=mtg_advanced') do |search_page|
				form = search_page.form_with(:id => 'search') do |search|    
					search['filter[name]'] = cardName
					search['filter[category_id]'] = ckCode
				end
				result_page = form.submit
				raw_results = result_page.search('div.itemContentWrapper')
				raw_results.each do |result|
					newCardName =  result.css('span.productDetailTitle').text.strip
					set =  result.css('div.productDetailSet').text.strip
					foil =  result.css('div.foil').text.strip
					price = result.css('span.sellDollarAmount')[0].text.strip + '.' + result.css('span.sellCentsAmount')[0].text.strip
					price = price.to_f
					if foil != "FOIL"
						@cardHash[key]["ckPrice"] = price
						unless @cardHash[key]["price"].nil?
							spread =  ((1 - (price/@cardHash[key]["price"]))*100)
						end
						@cardHash[key]["spread"] = spread							
					else 
						@cardHash[key]["ckFoil"] = price
						unless @cardHash[key]["foilPrice"].nil?
							spread =  ((1 - (price/@cardHash[key]["foilPrice"]))*100)
							newKey = key*2
							@foilHash[newKey] = {"name" => cardName + " *FOIL*", "price"=> @cardHash[key]["foilPrice"], "set"=> setCode, "ckPrice" => price, "spread" => spread}
							puts @foilHash[newKey]
						end
					end
					
				end	
			end
		end
			@cardHash.merge!(@foilHash)
			puts "=======77777"
			@cardHash = @cardHash.sort_by { |key, val| [val["spread"] ? 0 : 1, val["spread"] ] } 
			puts @cardHash

		
    		
	end

	




	
	def get_tcg_price(c)
		require 'uri'
		require 'net/http'
		tcgPrice = ""
		cardSet = c.set

		puts c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name
		puts cardName
		sleep 2
		url = URI("http://api.staging.tcgplayer.com/catalog/products?categoryId=1&limit=50&productName=" + cardName )

		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Get.new(url)
		request['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"


		response = http.request(request)
		data = JSON.parse(response.body)
		productId = data['results'][0]['productId']
		
		newUrl = URI("http://api.staging.tcgplayer.com/pricing/product/" + productId.to_s )

		newHttp = Net::HTTP.new(newUrl.host, newUrl.port)
		newRequest = Net::HTTP::Get.new(newUrl)
		newRequest['Authorization'] = "Bearer 1OG2H2tTUKbtBOXa0hxEggt04PT2jBSvL6lELPAI499-Dj2UI9K7MnNAKRFstfdmertPNm84lqqRnn3t_7zwpS0yilsCMLAglh3Aui3PNVh8bBc0jAD7cfDC2_uI6gEMhoxdUKlzfcNcmGwk56_Cj5iYcNYAlDBwMqarMqPFmMsDYyVH8MjpH8l7aeDj0nXmJ4EfaOvCZARRQhVKvxOsHuqIWh9A-A-1p6joj8m6MRoTbZJROOAivaHe_Z27VTL-4pAd46J6Euxxyb7v1-hIM4b3K3A1Ml8KdY2JyebC063NF_sa97XFJOTbHzzyAkhMB3jzkPTNzdl1NrXObuNOJf4bajk"
		newResponse = http.request(newRequest)
		newData = JSON.parse(newResponse.body)


		tcgPrice = newData['results'][0]['midPrice']
		@tcgPrice = tcgPrice
		puts "======" 
		puts @tcgPrice
		puts url 
		@tcgPrice




 
  	end






   #	def get_other_prices(c)
   #		sleep 2
#
   #		cardSet = c.set
	#	cardSetName = MTG::Set.find(cardSet).name
	#	cardName = c.name
#
	#	if cardSetName != "Friday Night Magic" and cardSetName.exclude? "From the Vault"
	#		url = "https://www.mtggoldfish.com/price/" + cardSetName.strip.gsub(' ', '+').gsub(/'/,"") + '/' + cardName.strip.gsub(' ', '+').gsub(/'/,"").gsub(',',"").gsub('.','+').gsub(':', '').gsub('?', "%253F").gsub('!','').gsub('é', 'e')
	#		puts url
	#		str = Nokogiri::HTML(open(url))
#
	#		prices = str.xpath('//div[@class="price-card-purchase"]/div[@class="price-card-buy-prices"]/a[@class="btn-shop btn btn-default price-card-purchase-button btn-paper-muted"]/div[@class="btn-shop-label"]')
	#		abuPrice = ""
	#		ckPrice = ""
	#		cfPrice = ""
	#		prices.each do |i|
	#			if i.text.strip == "ABU Games"
	#				abuPrice = i.next_element.text.strip.gsub("\n$", "").gsub(/\A\p{Space}*|\p{Space}*\z/, '')
	#			elsif i.text.strip == "Card Kingdom"
	#				ckPrice = i.next_element.text.strip.gsub("\n$", "").gsub(/\A\p{Space}*|\p{Space}*\z/, '')
	#			
	#			elsif i.text.strip == "Channell Fireball"
	#				cfPrice = i.next_element.text.strip.gsub("\n$", "").gsub(/\A\p{Space}*|\p{Space}*\z/, '')
	#			end
	#		end
	#		@priceArr.clear
	#		@priceArr << abuPrice 
	#		@priceArr << ckPrice
	#		@priceArr << cfPrice
#
#
#
	#	
	#		puts "----"
	#		puts @priceArr.length
	#		@priceArr
	#		sleep 5
	#	end 
#
		
		# cardSet = c.set
		# cardSetName = MTG::Set.find(cardSet).name
		# cardName = c.name

		# url = "http://www.mtgprice.com/sets/" + cardSetName.strip.gsub(' ', '_').gsub('_Edition', '') + '/' + cardName.strip.gsub(' ', '_')
		# puts url
		# str = Nokogiri::HTML(open(url))
		# sc = str.css('script')
		# js = sc[50].children.text.split('var sellPriceData =')[0]
		# newStr = js.gsub('var', '').gsub('=', ':').gsub('results', '"results"').gsub('color:', '"color":')
		# newStr = '{' + newStr.gsub('];', ']}')
		# jsonStr = JSON.parse(newStr)
		# abuStr = jsonStr["results"].map {|x| x["label"] if x['label'].include? "ABU"}.compact.first
		# ckStr = jsonStr["results"].map {|x| x["label"] if x['label'].include? "Card Kingdom"}.compact.first
		# cfStr  = jsonStr["results"].map {|x| x["label"] if x['label'].include? "ChannelFireball"}.compact.first
		# abuPrice = abuStr.split('-')[1]
		# ckPrice = ckStr.split('-')[1]
		# cfPrice = cfStr.split('-')[1]
		# @priceArr.clear
		# @priceArr << abuPrice 
		# @priceArr << ckPrice
		# @priceArr << cfPrice
		# puts "----"
		# puts @priceArr.length
		# @priceArr

	
  #	end



		
	def get_ck_prices(c)

		results = Array.new()
		@results.clear
		setCode = c[1]["set"]
		ckCode = MagicSet.find_by(sdkID: setCode)["ckID"]
		puts ckCode

	
		cardName = c[1]["name"]
		puts cardName
		scraper = Mechanize.new
		scraper.history_added = Proc.new { sleep 0.5 }
		
		 
		
		scraper.get('https://www.cardkingdom.com/purchasing/mtg_singles?filter[sort]=price_desc&filter[search]=mtg_advanced&filter[nonfoil]=1') do |search_page|
			form = search_page.form_with(:id => 'search') do |search|    
				search['filter[name]'] = cardName
				search['filter[category_id]'] = ckCode
			end
			result_page = form.submit
			raw_results = result_page.search('div.itemContentWrapper')
			raw_results.each do |result|
				newCardName =  result.css('span.productDetailTitle').text.strip
				set =  result.css('div.productDetailSet').text.strip
				foil =  result.css('div.foil').text.strip
				puts result.css('span.sellDollarAmount')[0].text.strip
				puts result.css('span.sellCentsAmount')[0].text.strip
				price = result.css('span.sellDollarAmount')[0].text.strip + '.' + result.css('span.sellCentsAmount')[0].text.strip
				price = price.to_f
				
		
				@results << price
		
		
			end
		end
	end




	#####################Channel FIREBALL #####################
	#def get_cf_prices(c)
	#	cardSet = c.set
	#	cardSetName = MTG::Set.find(cardSet).name
	#	cardName = c.name
	#	newScraper = Mechanize.new
	#	newScraper.history_added = Proc.new { sleep 0.5 }
	#	 
	#	newScraper.get('http://store.channelfireball.com/buylist/search') do |search_page|
	#		form = search_page.form_with(:id => 'searchform') do |search|
	#			search['c'] = '8'
	#			search['q'] = 'Avacyn'
	#		end
	#		result_page = form.submit
	#		raw_results = result_page.search('li.product_row')
	#		raw_results.each do |result|
	#			i = 0
	#			cardName = result.css('h4.name').text.strip
	#			set = result.css('h5.category').text.strip
	#			price = result.css('span.price').text.strip
#
	#			puts price
	#			puts cardName
	#			puts set
	#			
#
#
#
	#		end
	#	end
	#end

end
