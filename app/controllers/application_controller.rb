class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :test

	def test
		card = MTG::Card.where(set: 'ktk')

	  	$i = 0
	  	while $i < card.length do  
			cardSet = card[$i].set
			cardSetName = MTG::Set.find(cardSet).name
			cardName = card[$i].name
			url = "https://www.mtggoldfish.com/price/" + cardSetName.strip.gsub(' ', '+').gsub(/'/,"") + '/' + cardName.strip.gsub(' ', '+').gsub(/'/,"")
			puts url
			doc = Nokogiri::HTML(open(url))
			price = doc.css('.price-box-price')[1].text
			puts("#{price}")
			$i +=1
		end

		def index
		end
	end
end
