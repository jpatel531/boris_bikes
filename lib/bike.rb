class Bike

def initialize
	self.fix!
end

def broken?
	@broken
end

def break!
	@broken = true
	self
end

def fix!
	@broken = false
	self
end

end