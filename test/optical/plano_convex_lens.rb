require 'minitest/autorun'
require 'optical/plano_convex_lens'

describe Optical::PlanoConvexLens do
    let(:lens) { Optical::PlanoConvexLens.new(center_thickness:3, diameter:15, edge_thickness:2, radius_of_curvature:20) }

    it 'must report the maximum thickness when no arguments are given' do
	lens.thickness.must_equal 3
    end

    it 'must report the thickness at a given radius' do
	lens.thickness(5).must_be_close_to 2.364
    end

    it 'must report the thickness at a given radius with a named parameter' do
	lens.thickness(radius:5).must_be_close_to 2.364
    end

    it 'must report the thickness at a given diameter with a named parameter' do
	lens.thickness(diameter:10).must_equal lens.thickness(radius:5)
    end

    it 'must raise an exception if the requested radius is outside the lens' do
	->{ lens.thickness(radius:10) }.must_raise ArgumentError
    end
end
