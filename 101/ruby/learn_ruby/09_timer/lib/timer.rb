class Timer
	def initialize
		@seconds = 0
	end

	def seconds
		@seconds
	end

	def seconds=(numero)
		@seconds = numero
	end

	def time_string
		hours = 0
		dez_hour = 0
		unt_hour = 0
		minutes = 0
		dez_min = 0
		unt_min = 0
		seconds_temp = 0
		dez_sec = 0
		unt_sec = 0

		hours = @seconds/3600
		dez_hour = hours/10
		unt_hour = hours - dez_hour*10

		minutes = @seconds / 60 - 60 * hours
		dez_min = minutes/10
		unt_min = minutes - dez_min * 10

		seconds_temp = @seconds - 3600*hours - 60*minutes 
		dez_sec = seconds_temp/10
		unt_sec = seconds_temp - dez_sec *10

		dez_hour.to_s + unt_hour.to_s + ":" + dez_min.to_s + unt_min.to_s + ":" + dez_sec.to_s + unt_sec.to_s
	end
end