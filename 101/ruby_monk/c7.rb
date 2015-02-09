palavras = []
palavra_da_vez = " "

while palavra_da_vez != "" 
	puts "Digite uma palavra :)"
	palavra_da_vez = gets.chomp
	if palavra_da_vez != ""
		palavras.push(palavra_da_vez)
	end
	puts palavras.sort
end

