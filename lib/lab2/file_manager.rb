class FileManager
	def save(valera)
		hash = {'health' => valera.health,
      		'alcomana' => valera.alcomana, 'happy' => valera.happy,
      		'tired' => valera.tired, 'money' => valera.money
      	}

		File.open(File.dirname(__FILE__) + "/saved_game.json","w") do |f|
			f.write(JSON.pretty_generate(hash))
		end
	end

	def load_game
		file_new = open File.dirname(__FILE__) + "/saved_game.json"
		hash_new = JSON.parse(file_new.read)
		return hash_new
	end

	def load_config
		file = open File.dirname(__FILE__) + "/actions.json"
		hash = JSON.parse(file.read)
		return hash
	end
end
