class Fleet

	def initialize
		@cars = []
	end

	def add(new_car)
		@cars.push(new_car)
	end

	def load_from_file(file_name)
		require 'json'
		json_data = File.read(file_name)
		ruby_objects = JSON.parse(json_data)
		ruby_objects.each do |car|
			add(Auto.new(car['mark'], car['model'], car['year'], car['consumption']))
		end
	end


end
