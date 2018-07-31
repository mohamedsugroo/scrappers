class BlackListed


	def self.getLinks(links, blacklisted)

		if blacklisted.include? links.to_s
			return 'this link includes black listed matirial'
		else
			return links
		end

	end

end



