class Array
	def eachEven(&was_a_block_now_a_proc)
		
		is_even = true

		self.each do |object|
			if is_even
				was_a_block_now_a_proc.call object
			end

			is_even = (not is_even)

		end
	end
end

array = ["maçã", "banana", "melancia", "pêra", "abacate", "jabuticaba"]

array.eachEven do |fruta|
	puts "yey, hoje eu comi "+fruta+" e foi incrível!"
end