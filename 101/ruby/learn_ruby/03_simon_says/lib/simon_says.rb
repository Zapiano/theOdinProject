def echo (eco)
	eco
end

def shout (grito)
	grito.upcase
end

def repeat (repeticao, quantas = 2)
	final = repeticao
	quantas = quantas - 1
	quantas.times do
		final = final + " " + repeticao
	end

	final
end

def start_of_word (palavra,comeco)
	final = ""
	comeco.times do
		final = final + palavra[comeco-1]
		comeco = comeco - 1
	end
	final.reverse
end

def first_word (palavra)
	final = ""
	i = 0
	while palavra[i] != " "
		final = final + palavra[i]
		i = i + 1		
	end
	final
end

def titleize (frase)
	vetor_palavras = frase.split(" ")
	vetor_frase = [vetor_palavras[0].capitalize]
	vetor_palavras.delete_at(0)

	vetor_palavras.each do |i|
		if (i == "and" or i == "over" or i=="the")
			vetor_frase << i
		else 
			vetor_frase << i.capitalize
		end
	end
	
	frase = vetor_frase.join(" ")
end

