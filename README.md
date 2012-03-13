# SortByFrequency

## Copyright and Licensing

### Copyright Notice

The copyright for the software, documentation, and associated files are
held by the author.

    Copyright 2012 Todd A. Jacobs
    All rights reserved.

The AUTHORS file is also included in the source tree.

### Software License

![GPLv3 Logo](http://www.gnu.org/graphics/gplv3-88x31.png)

The software is licensed under the
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The LICENSE is also
included in the source tree.

### README License

![Creative Commons BY-NC-SA
Logo](http://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png)

This README is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 United States
License](http://creativecommons.org/licenses/by-nc-sa/3.0/us/).

## Purpose

Small Ruby module for sorting an array of integers by frequency.

## Usage:

    ruby sort_by_frequency.rb [ <integer> ... ]

## Caveats

* The CLI coerces arguments into Fixnum, but
  SortByFrequency#sort_integers currently does not.
* The behavior of the method when comparing alphanumerics, strings,
  mixed-type data, or anything else is currently undefined.

## Compatibility

The module was tested against Ruby 1.9.3-p125 on the MRI interpreter.

## Examples

    # Use default data set.
    ruby sort_by_frequency.rb

    # Use custom data set.
    ruby sort_by_frequency.rb 1 2 2 2 3 3

## Sample Output

This is an example what you should see when running sort_by_frequency.rb
from the command line.

    $ ruby sort_by_frequency.rb
    [1, 2, 2, 2, 3, 3]
    [2, 3, 1]

The first line of output is the raw data set, and the second is the
sorted list of integers by frequency.

----
