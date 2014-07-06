require 'minitest/autorun'
require 'optical/lens'

describe Optical::Lens do
    it 'must initialize itself from named parameters' do
	lens = Optical::Lens.new(radius:1, focal_length:5)
	lens.must_be_instance_of Optical::Lens
	lens.diameter.must_equal 2
	lens.focal_length.must_equal 5
    end

    it 'must have a center thickness' do
	Optical::Lens.new(center_thickness: 5).center_thickness.must_equal 5
    end

    it 'must have an edge thickness' do
	Optical::Lens.new(edge_thickness: 4).edge_thickness.must_equal 4
    end

    it 'must have a thickness attribute that is the maximum thickness' do
	Optical::Lens.new(center_thickness:2, edge_thickness:5).thickness.must_equal 5
    end

    it 'must have a numerical aperture' do
	lens = Optical::Lens.new(radius:1, focal_length:5)
	lens.numerical_aperture.must_be_close_to 0.196
    end
end
