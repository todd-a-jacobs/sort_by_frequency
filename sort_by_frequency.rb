#!/usr/bin/env ruby

# Name:
#    sort_by_frequency.rb
#
# Purpose:
#    Small Ruby module for sorting an array of integers by frequency.
#
# Usage:
#     ruby sort_by_frequency.rb [ <integer> ... ]
#
# Options:
#     none
#
# Exit Status Codes:
#     0  = Success
#
# Copyright:
#     Copyright 2012 Todd A. Jacobs
#     All Rights Reserved
#
# License:
#     Released under the GNU General Public License (GPL)
#     http://www.gnu.org/copyleft/gpl.html
#
#     This program is free software; you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by the Free
#     Software Foundation; either version 3 of the License, or (at your option)
#     any later version.
#
#     This program is distributed in the hope that it will be useful, but
#     WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#     or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.

$VERBOSE = true

module SortByFrequency
  # Use token buckets to count and sort an array of integers by frequency.
  def self.sort_integers(integers_array)
    counters = {}

    # Initialize a token bucket for every unique item in the integers_array,
    # using the item itself as a key.
    integers_array.uniq.sort.each { |i| counters[i] = 0 }

    # Each item in the integers_array is "sorted" into a corresponding bucket by
    # incrementing its counter.
    integers_array.each { |i| counters[i] += 1 }

    # Buckets with more tokens have higher frequency. Convert the counters to an
    # array of buckets, sorted by the token counter stored in the second element
    # of each sub-array. This has the salutary effect of sorting the array in
    # descending order by frequency.
    sorted_array = counters.sort_by { |key, value| value }.reverse

    # While it looks like you could do something elegant like:
    #
    #     Hash[*sorted_array.flatten].keys
    #
    # here, you actually shouldn't; hash order is implementation-specific and
    # not guaranteed. Instead, we'll just strip out the counters from each
    # bucket, leaving just the keys, then return that list of keys in sorted
    # order.
    sorted_array.each { |bucket| bucket.delete_at(1) }.flatten
  end # def sort_by_frequency
end # module SortByFrequency

if __FILE__ == $0
  numbers = (ARGV.any?) ? ARGV.to_s.scan(/\d+/).map(&:to_i) : [1, 2, 2, 2, 3, 3]
  p numbers, SortByFrequency.sort_integers(numbers)
end
