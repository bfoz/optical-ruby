module Optical
    # A representation of a simple thin lens
    # http://en.wikipedia.org/wiki/Lens_(optics)
    class Lens
	# @!attribute [r] focal_length
	#   @return [Number]  the distance from the principal plane to the focal point
	attr_reader :focal_length

	def initialize(**options)
	    options.each {|k,v| respond_to?(k) ? instance_variable_set("@#{k}", v) : raise(ArgumentError, "Unknown argument: '#{k}'") }
	end

	# @!attribute [r] clear_diameter
	#   @return [Number]  the diameter of the portion of the {Lens} that meets its stated specifications
	def clear_diameter
	    @clear_diameter || (2*@clear_radius)
	end
	alias :clear_aperture :clear_diameter

	# @!attribute [r] clear_radius
	#   @return [Number]  the radius of the portion of the {Lens} that meets its stated specifications
	def clear_radius
	    @clear_radius || (@clear_diameter && @clear_diameter/2)
	end

	# @!attribute [r] center_thickness
	#   @return [Number]  the thickness of the {Lens} at its center
	attr_reader :center_thickness

	# @!attribute diameter
	#   @return [Number]  the physical diameter of the {Lens}
	def diameter
	    @diameter || 2*@radius
	end

	# @!attribute [r] edge_thickness
	#   @return [Number]  the thickness of the {Lens} at its edge
	attr_accessor :edge_thickness

	# @!attribute [r] numerical_aperture
	#   @return [Number]  the numerical aperture of the lens, based on clear_radius (if set; otherwise it's based on radius)
	def numerical_aperture
	    Math.sin(Math.atan2(clear_radius || radius, focal_length))
	end

	# @!attribute [r] radius
	#   @return [Number]	the physical radius of the {Lens}
	def radius
	    @radius || @diameter/2
	end

	# @!attribute thickness
	#   @return [Number]  the maximum thickness of the {Lens}
	def thickness
	    [@center_thickness, @edge_thickness].max
	end
    end
end
