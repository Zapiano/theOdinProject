class Book
	def title=(title)
		@title = title
	end

	def capitalize? (string)
		vetor_consulta = ["the", "a", "in", "and", "of", "an", "for"]
		resultado = true

		vetor_consulta.each do |i|
			if string == i
				resultado = false
			end
		end
		resultado
	end

	def title
		titulo = @title.split(" ")
		resultado = []

		resultado<<titulo[0].capitalize
		titulo.delete_at(0)
		titulo.each do |i|
			if capitalize?(i)
				resultado<<i.capitalize
			else
				resultado<<i
			end
		end

		resultado.join(" ")
	end
end