class HomeController < ApplicationController
require 'open-uri'
#require 'mechanize'

helper_method :get_other_prices
 helper_method :get_tcg_price



	def index
		@sets = MTG::Set.all
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
		sleep 2

		
		cardSet = c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name

		url = "https://www.mtggoldfish.com/price/" + cardSetName.strip.gsub(' ', '+').gsub(/'/,"") + '/' + cardName.strip.gsub(' ', '+').gsub(/'/,"").gsub(',',"").gsub('.','+').gsub(':', '').gsub('?', "%253F").gsub('!','').gsub('é', 'e')
		

		doc = Nokogiri::XML(open(url))
		doc2 = doc.children[1].children[1]
		puts doc2.children.length
		@newPrice = 0
		x = doc2.children[25]
 		price = x.css('.price-box-price')[1].text
 		puts price
 		if price != "" 
 			@newPrice = price
 			
 		end
 		
 		@newPrice
 		sleep 5



 	
			
  	end




   	def get_other_prices(c)
   		sleep 2

   		cardSet = c.set
		cardSetName = MTG::Set.find(cardSet).name
		cardName = c.name

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



	
####################### CARD KINGDOM ######################

#scraper = Mechanize.new
#scraper.history_added = Proc.new { sleep 0.5 }
#
#ADDRESSCK = 'https://www.cardkingdom.com/purchasing/mtg_singles?filter[sort]=price_desc'
#
#scraper.get(ADDRESS) do |search_page|
#	form = search_page.form_with(:id => 'search') do |search|    
#		search['filter[name]'] = 'Avacyn'
#	end
#	result_page = form.submit
#	raw_results = result_page.search('div.itemContentWrapper')
#	raw_results.each do |result|
#		cardName =  result.css('span.productDetailTitle').text.strip
#		set =  result.css('div.productDetailSet').text.strip
#		foil =  result.css('div.foil').text.strip
#		puts result.css('span.sellDollarAmount')[0].text.strip
#		puts result.css('span.sellCentsAmount')[0].text.strip
#		price = result.css('span.sellDollarAmount')[0].text.strip + '.' + result.css('span.sellCentsAmount')[0].text.strip
#		price = price.to_f
#
#		results << [cardName, price, set, 'CK']
#
#
#	end
#end




#####################Channel FIREBALL #####################

#ADDRESSCF = 'http://store.channelfireball.com/buylist/search'
#newScraper.get(ADDRESSCF) do |search_page|
#	form = search_page.form_with(:id => 'searchform') do |search|
#		search['c'] = '8'
#		search['q'] = 'Avacyn'
#	end
#	result_page = form.submit
#	raw_results = result_page.search('li.product_row')
#	raw_results.each do |result|
#		i = 0
#		cardName = result.css('h4.name').text.strip
#		set = result.css('h5.category').text.strip
#		price = result.css('span.price').text.strip
#
#		puts price
#		puts cardName
#		puts set
#		
#
#
#
#	end
#end

end
