desc 'remove foil cards'

task :remove_foils => :environment do

	MagicCard.where("productID < ?", 0).all.each do |x|
	    x.destroy
	end
end