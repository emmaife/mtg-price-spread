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
		@sets = MagicSet.all.order(:sdkID)
  		if params[:q]
  			@cards = MTG::Card.where(name: params[:q]).all
  		else

    		@cards = MTG::Card.where(page: 1).where(pageSize: 20).all
  		end
  		@negativeCards = MagicCard.where("spread < ?", 0).order(:spread)[0..4]
		@bestPosSpread = MagicCard.where("spread >= ?", 0).where("spread < ?", 21).where(set: ['KLD', 'AER', 'AKH', 'W17','HOU', 'XLN', 'RIX', 'DOM']).order(:spread)[0..4]
	end

	def search
		@cardHash = Hash.new
		@priceArr = Array.new
		@results = Array.new
		cardNames = Array.new
		if params[:q] != "" && params[:q].present?
    		@results = MagicCard.where('lower(name) like ?', "%#{params[:q].downcase}%").where.not(spread: nil).order(:spread)


		else
			params[:set].each do |k|
				puts k.to_s + '---'
				set = MagicSet.find_by(id: k)
				c = MagicCard.where(set: set['sdkID'])
				
				#unless c['spread'].nil?
					@results << MagicCard.where(set: set['sdkID']).where.not(spread: nil)
				#end

				
			end
			@results.flatten!
			puts @results[0]
			@results.sort_by!{|x| x['spread']}

			@results
			
		end
	end

	def neg_spread
		@negativeCards = MagicCard.where("spread < ?", 0).order(:spread)
	end

	def low_spread
		@lowSpread = MagicCard.where("spread >= ?", 0).where("spread < ?", 21).where(set: ['KLD', 'AER', 'AKH', 'W17','HOU', 'XLN', 'RIX', 'DOM']).order(:spread)
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
