def consoante? (letra)
	consoantes = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","z"]
	achei = false
	consoantes.each do |i|
		if i == letra
			achei = true
		end
	end
	achei
end

def translate (frase)
	vetor_frase = frase.split(" ")
	vetor_final = []

	vetor_frase.each do |palavra|
		string_consoantes = ""
		ultimo_char = ""
		final_temp = ""

		while consoante?(palavra[0])
			string_consoantes = string_consoantes + palavra[0]
			ultimo_char = palavra[0]
			palavra.slice!(0)
		end

		if palavra[0] == "u" and ultimo_char == "q"
			string_consoantes = string_consoantes + palavra[0]
			ultimo_char = palavra[0]
			palavra.slice!(0)
		end

		final_temp = palavra + string_consoantes + "ay"
		vetor_final.push(final_temp)
	end

	vetor_final.join(" ")
end

#nova ideia: fazer ele ler palavra por palavra de um vetor
#e salvar todas as consoantes numa outra string (qu conta como duas consoantes)
#depois tira as primeiras outra_string.length da palavra
#e coloca no fim 
#ai tem um if else que ve se a palavra termina com "ay"
#se terminar nao faz nada, se nao terminar add "ay" no final

#seria bom fazer uma funçao consoante? e ai posso add o qu de algum jeito. =p (tipo if palavra[i] == u and palavra[i-1] == q => true)