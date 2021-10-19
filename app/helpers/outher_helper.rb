module OutherHelper
	def date(field)
		if field.present? 
			field.strftime("%d/%m/%Y") 	
		end
	end

	
end

