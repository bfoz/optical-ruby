require_relative 'lens'

module Optical
    # A representation of a plano convex lens
    class PlanoConvexLens < Lens
	# @!attribute radius_of_curvature
	#   @return [Number]  the radius of curvature of the optical surface
	attr_reader :radius_of_curvature

	# @!attribute thickness
	#   @param radius [Number]  the distance from the ceterline of the lens
	#   @return [Number]  the thickness of the {Lens} at a given distance from the centerline
	def thickness(_radius=nil, **options)
	    return super() if !_radius && options.empty?

	    _radius ||= options[:radius] || (options[:diameter]/2)

	    raise ArgumentError, "Requested radius (#{_radius}) is outside of the lens" if _radius > radius

	    if _radius && center_thickness && radius_of_curvature
		center_thickness - radius_of_curvature + Math.sqrt(radius_of_curvature**2 - _radius**2)
	    end
	end
    end
end
