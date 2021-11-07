class Valera
	attr_reader :health, :alcomana, :happy, :tired
	attr_accessor :money

	def initialize(health = 100, alcomana = 0, happy = 0, tired  = 0, money = 300)
		@health = health
		@alcomana = alcomana
		@happy = happy
		@tired  = tired
		@money = money
	end

	def dead?
		@health == 0 || @happy == -10 || @money <= -100 || @tired == 100
	end

	def health=(health)
		@health = validate(health, 0, 100)
	end

	def alcomana=(alcomana)
		@health -= validate(@alcomana - alcomana, 0, @health)
		@alcomana = validate(alcomana, 0, 100)
	end

	def happy=(happy)
		@happy = validate(happy, -10, 10)
	end

	def tired=(tired)
		@tired = validate(tired, 0, 100)
	end

	private def validate(value, min, max)
		[[value, max].min, min].max
	end
end

