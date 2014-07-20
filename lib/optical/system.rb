module Optical
=begin
An Optical System is a set of Optical Elements, generally arranged in a line.
=end
    class System
	# @!attribute elements
	#   @return [Array]  the set of elements in the system
	attr_reader :elements

	# @!attribute spacing
	#   @return [Number]  the default spacing to add between newly added elements
	attr_accessor :spacing

	# Convenience method for creating a new {Spacer}
	def self.spacer(space)
	    Spacer::new(space)
	end

	def initialize
	    @elements = []
	end

	# Append a new Optical element
	# @return [System]
	def push(element)
	    if element.is_a?(Numeric)
		@elements.push Spacer.new(element)
	    elsif element.is_a?(Spacer)
		@elements.push element
	    else
		@elements.push Spacer.new(spacing) if spacing && !(elements.empty? || elements.last.is_a?(Spacer))
		@elements.push element
	    end

	    self
	end

	class Spacer
	    attr_reader :space

	    # @param space [Number] the length of the {Spacer}
	    def initialize(space)
		@space = space
	    end
	end
    end
end
