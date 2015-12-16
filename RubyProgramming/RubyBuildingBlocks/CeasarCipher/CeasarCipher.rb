def translada (letra,x)
	alfabeto = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
	letra = letra.downcase()
	puts letra
	posicao = 0
	while alfabeto[posicao] != letra do
		posicao += 1
	end

	if posicao + x < alfabeto.length
		posicao += x
	else
		posicao = posicao + x - alfabeto.length
	end

	return alfabeto[posicao]
end

def ceasar_cipher (cifra)
	original = gets.chomp.split("")
	cifrada = original
	j = 0
	original.each do |i|
		if cifrada[j] != " "
			cifrada[j] = translada(original[j],cifra)			
		end
		j += 1
	end
	cifrada = cifrada.join()
	puts cifrada
end

ceasar_cipher(3)