require 'minitest/autorun'
require 'optical/system'

describe Optical::System do
    let(:subject) { Optical::System.new }

    it 'must not have any elements' do
	subject.elements.empty?.must_equal true
    end

    it 'must push a Lens' do
	subject.push Optical::Lens.new
	subject.elements.length.must_equal 1
	subject.elements.last.must_be_instance_of Optical::Lens
    end

    it 'must push multiple Lenses' do
	subject.push Optical::Lens.new
	subject.push Optical::Lens.new
	subject.elements.length.must_equal 2
	subject.elements.all? {|e| e.is_a? Optical::Lens }.must_equal true
    end

    it 'must push a Lens and a Spacer' do
	subject.push Optical::Lens.new
	subject.push Optical::System.spacer(10)
	subject.elements.length.must_equal 2
	subject.elements.first.must_be_instance_of Optical::Lens
	subject.elements.last.must_be_instance_of Optical::System::Spacer
    end

    it 'must push a Lens and a convenience Spacer' do
	subject.push Optical::Lens.new
	subject.push 10
	subject.elements.length.must_equal 2
	subject.elements.first.must_be_instance_of Optical::Lens
	subject.elements.last.must_be_instance_of Optical::System::Spacer
    end

    it 'must have a default spacing between elements' do
	subject.spacing = 10
	subject.push Optical::Lens.new
	subject.push Optical::Lens.new
	subject.elements.length.must_equal 3
	subject.elements.first.must_be_instance_of Optical::Lens
	subject.elements[1].must_be_instance_of Optical::System::Spacer
	subject.elements.last.must_be_instance_of Optical::Lens
    end

    it 'must not push two spacers when a default spacing is set' do
	subject.spacing = 10
	subject.push Optical::Lens.new
	subject.push Optical::System.spacer(10)
	subject.push Optical::Lens.new
	subject.elements.length.must_equal 3
	subject.elements.first.must_be_instance_of Optical::Lens
	subject.elements[1].must_be_instance_of Optical::System::Spacer
	subject.elements.last.must_be_instance_of Optical::Lens
    end
end
