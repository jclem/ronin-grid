# Ronin

Ronin is a framework for creating responsive web designs with SASS.

---

## Installation

### Rails

In your `Gemfile`:

```ruby
gem 'ronin-grid' 
```

Run the installer:

```bash
rake ronin-grid:install
```

We do not want Ronin's SASS files to be compiled, so remove the following line
from `app/assets/stylesheets/application.css`:

```css
*= require_tree .
```

Import Ronin into your SASS stylesheets:

```scss
@import 'ronin-grid';
```

Customize:

```bash
vim app/assets/stylesheets/ronin-grid/_setup.scss
```

### Non-Rails

Use the binary:

```bash
ronin-grid install
# Creates ronin-grid/lib/ronin-grid/...
```

or:

```bash
ronin-grid install-bare
# Creates _ronin-grid.scss
# Creates ronin-grid/...
```
---

## Usage

Given the following HTML:

```html
<div class='page-container'>
  <div id='some-content'>
    <p>Lorem ipsum...</p>
  </div>

  <div id='more-content'>
    <p>Lorem ipsum...</p>
  </div>
</div>
```

Apply Ronin's `container` mixin to your content container, and the `cols` mixin to your content:

```scss
.page-container {
  @include container;
}

#some-content {
  @include cols(6);
}

#more-content {
  @include cols(6);
}
```

Respond with media queries with ease, writing the queries explicitly or using Ronin's built-in mixins:

```scss
#some-content {
  @include cols(6);
  @media screen and (max-width: 480px) {
    @include cols(12);
  }
}

#more-content {
  @include cols(6);
  @include respond-to(840px, 9);
  @include respond-to(480px, 12);
}
```
---

## Advanced Usage

Ronin can be used as a starting point for a project-specific framework. The code is well-marked up and easily tailored to a project, and I'm around to provide support on [Twitter][twitter].

---

## About Breakpoints

I'm using the term loosely. "Breakpoint" is usually used to mean the point at which a site's layout breaks and media queries should be used to prevent breakage. I'm using it to mean a point at which adjusting content width would improve readability or usability on a page. 

The [example page][grid_example_page] has a table of Ronin's default breakpoints and how they effect elements using the `cols` mixin.

---

## Limitations

Elements using the `cols` mixin cannot be nested inside of one another.

---

## Author & License

Ronin is by [Jonathan Clem][jonathan_clem].

Copyright (c) 2012, Jonathan Clem

All rights reserved.

Released under a [modified MIT license][license]

[twitter]: http://twitter.com/_clem
[license]: http://github.com/jclem/ronin-grid/tree/master/LICENSE.md
[jonathan_clem]: http://jclem.net
