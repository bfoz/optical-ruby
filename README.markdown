# Optical

Remember that optics class you took in college? Me neither, and that's why I wrote this gem.

## Installation

Add this line to your application's Gemfile:

    gem 'optical'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optical

## Usage

### Lenses

The optical gem has primitives for modeling generic thin-lenses, as well as more specific lens types.

To model a simple thin lens, simply...

```ruby
lens = Optical::Lens.new diameter:12.mm, focal_length:20.mm
```

A Plano-Convex lens is just as easy to make...

```ruby
lens = Optical::Lens.new diameter:12.mm, focal_length:20.mm
```

### Optical Systems

A simple optical system (no splitters) can be modeled using the familiar `push` syntax.

```ruby
system = Optical::System.new
system.push Optical::Lens.new
system.push Optical::Lens.new
```

The two lenses in that last example won't have any space between, which is almost
never what you want. You can set the distance between them by pushing a special
spacer element.

```ruby
system.push Optical::Lens.new
system.push Optical::System.spacer(10.mm)
system.push Optical::Lens.new
```

or you can simply push any Numeric-like object

```ruby
system.push Optical::Lens.new
system.push 10.mm
system.push Optical::Lens.new
```

If you have a number of elements that all need the same spacing, you can set a
default spacing value before pushing the elements. The default value will be in
effect until changed.

```ruby
system.spacing = 10.mm
system.push Optical::Lens.new	# These two elements will get a 10mm spacer
system.push Optical::Lens.new	#  added between them automatically
```
