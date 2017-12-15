class HomeController < ApplicationController
	require 'open-uri'
	require 'mechanize'
	require 'uri'
	require 'net/http'

	helper_method :get_other_prices
	helper_method :get_tcg_price
	helper_method :get_cf_prices
	helper_method :get_ck_prices



	def index
		@sets = MTG::Set.all
		#@sets =  MTG::Set.where(expansion: 'core|expansion').all.select { |hash_element| hash_element.type !='promo' }
		#@sets.each do |x|
		#	str = str + x.name + "|"
		#end
		#str.chop!
  		if params[:q]
  			@cards = MTG::Card.where(name: params[:q]).all
  		else

    		@cards = MTG::Card.where(page: 1).where(pageSize: 20).all
  		end
	end

	def search
		@priceArr = Array.new
		if params[:q] != ""
    		@cards = MTG::Card.where(name: params[:q]).all
    	
		else
			params[:set].each do |k,v|
				puts k
				@cards = Array.new
				puts params[:set].length
				(@cards << MTG::Card.where(set: k).all).flatten!
				puts @cards.length
				return @cards
				

			end
			
		

		end

		
		
    		
	end

	




	
	def get_tcg_price(c)
		require 'uri'
		require 'net/http'
		tcgPrice = ""
		cardSet = c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name
		sleep 2
		url = URI("http://api.staging.tcgplayer.com/catalog/products?categoryId=1&limit=50&productName=" + cardName )

		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Get.new(url)
		request['Authorization'] = "Bearer jzJHnEkCSmZiBoeLZ5Y9U6uaZtcpSqPN8WBzgNrKHXU8DkuGtdgBU93oBjgbNOUFScJQuwIwfrixCy03pATrRT7b6j14hnHTNtvQgY9MVwH7ugKo5Mro5IY8uxcwnfQmWYSCJSe5fr31mS5tUTycQbWvsKy-9Z_XrVyiN32QRawGFIKaFP-Ipazf181dxfl2_Wb2IwETFKipG-AmQOxLnaUKphv3q4iHMNQQd7UqTxkgUyHvLzXgL_Cuv8pz6PdsbLY20gSdiCbTj32a2Ih3xDnS61QPrSC9M_Md16s60a-waJfc1hnEpitdqcP41mGcCkz3NvOjkPojpyx6epkpQFmudMw"


		response = http.request(request)
		data = JSON.parse(response.body)
		productId = data['results'][0]['productId']
		
		newUrl = URI("http://api.staging.tcgplayer.com/pricing/product/" + productId.to_s )

		newHttp = Net::HTTP.new(newUrl.host, newUrl.port)
		newRequest = Net::HTTP::Get.new(newUrl)
		newRequest['Authorization'] = "Bearer jzJHnEkCSmZiBoeLZ5Y9U6uaZtcpSqPN8WBzgNrKHXU8DkuGtdgBU93oBjgbNOUFScJQuwIwfrixCy03pATrRT7b6j14hnHTNtvQgY9MVwH7ugKo5Mro5IY8uxcwnfQmWYSCJSe5fr31mS5tUTycQbWvsKy-9Z_XrVyiN32QRawGFIKaFP-Ipazf181dxfl2_Wb2IwETFKipG-AmQOxLnaUKphv3q4iHMNQQd7UqTxkgUyHvLzXgL_Cuv8pz6PdsbLY20gSdiCbTj32a2Ih3xDnS61QPrSC9M_Md16s60a-waJfc1hnEpitdqcP41mGcCkz3NvOjkPojpyx6epkpQFmudMw"
		newResponse = http.request(newRequest)
		newData = JSON.parse(newResponse.body)


		tcgPrice = newData['results'][0]['midPrice']
		@tcgPrice = tcgPrice
		puts "======" 
		puts @tcgPrice
		puts url 
		@tcgPrice




 
  	end






   	def get_other_prices(c)
   		sleep 2

   		cardSet = c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name

		if cardSetName != "Friday Night Magic" and cardSetName.exclude? "From the Vault"
			url = "https://www.mtggoldfish.com/price/" + cardSetName.strip.gsub(' ', '+').gsub(/'/,"") + '/' + cardName.strip.gsub(' ', '+').gsub(/'/,"").gsub(',',"").gsub('.','+').gsub(':', '').gsub('?', "%253F").gsub('!','').gsub('é', 'e')
			puts url
			str = Nokogiri::HTML(open(url))

			prices = str.xpath('//div[@class="price-card-purchase"]/div[@class="price-card-buy-prices"]/a[@class="btn-shop btn btn-default price-card-purchase-button btn-paper-muted"]/div[@class="btn-shop-label"]')
			abuPrice = ""
			ckPrice = ""
			cfPrice = ""
			prices.each do |i|
				if i.text.strip == "ABU Games"
					abuPrice = i.next_element.text.strip.gsub("\n$", "").gsub(/\A\p{Space}*|\p{Space}*\z/, '')
				elsif i.text.strip == "Card Kingdom"
					ckPrice = i.next_element.text.strip.gsub("\n$", "").gsub(/\A\p{Space}*|\p{Space}*\z/, '')
				
				elsif i.text.strip == "Channell Fireball"
					cfPrice = i.next_element.text.strip.gsub("\n$", "").gsub(/\A\p{Space}*|\p{Space}*\z/, '')
				end
			end
			@priceArr.clear
			@priceArr << abuPrice 
			@priceArr << ckPrice
			@priceArr << cfPrice



		
			puts "----"
			puts @priceArr.length
			@priceArr
			sleep 5
		end 

		
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

	
  	end



		
	def get_ck_prices(c)
		results = Array.new()
		cardSet = c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name
		scraper = Mechanize.new
		scraper.history_added = Proc.new { sleep 0.5 }

		 

		scraper.get('https://www.cardkingdom.com/purchasing/mtg_singles?filter[sort]=price_desc') do |search_page|
			form = search_page.form_with(:id => 'search') do |search|    
				search['filter[name]'] = cardName
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

				results << [newCardName, price, set, 'CK']


			end
		end
	end




	#####################Channel FIREBALL #####################
	def get_cf_prices(c)
		cardSet = c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name
		newScraper = Mechanize.new
		newScraper.history_added = Proc.new { sleep 0.5 }
		 
		newScraper.get('http://store.channelfireball.com/buylist/search') do |search_page|
			form = search_page.form_with(:id => 'searchform') do |search|
				search['c'] = '8'
				search['q'] = 'Avacyn'
			end
			result_page = form.submit
			raw_results = result_page.search('li.product_row')
			raw_results.each do |result|
				i = 0
				cardName = result.css('h4.name').text.strip
				set = result.css('h5.category').text.strip
				price = result.css('span.price').text.strip

				puts price
				puts cardName
				puts set
				



			end
		end
	end

end
