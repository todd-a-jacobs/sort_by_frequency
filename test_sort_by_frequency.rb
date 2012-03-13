#!/usr/bin/env ruby

require_relative 'sort_by_frequency'
require 'minitest/autorun'

describe SortByFrequency do
  describe '#sort_integers' do
    let(:numbers) { [1, 2, 2, 2, 3, 3] }

    it 'should sort numbers properly' do
      SortByFrequency.sort_integers(numbers).must_equal [2, 3, 1]
    end
  end
end
