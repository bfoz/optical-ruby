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
