class Player
	attr_accessor :name, :token, :history

	def initialize(args)
		@name    = args.fetch(:name, "John" + rand(99).to_s) # We are unlikely to default but since it’s up to the user...
		@token   = args.fetch(:token)
		@history = args.fetch(:history, [])
	end
end
