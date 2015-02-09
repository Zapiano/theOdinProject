def add(a,b)
	a+b
end

def subtract(a,b)
	a-b
end

def sum(numeros)
	resultado = 0
	numeros.each {|i| resultado = resultado + i}
	resultado
end

def multiply(numeros)
	resultado = 1
	numeros.each {|i| resultado = resultado * i}
	resultado
end

def power(a,b)
	resultado = 1
	b.times do
		resultado = resultado * a		
	end
	resultado
end

def factorial(a)	
	resultado = 1
	a.times do
		resultado = resultado * a
		a = a - 1
	end
	resultado
end