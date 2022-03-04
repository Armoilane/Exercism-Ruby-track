require 'benchmark/ips'
require_relative 'leap'

module AlternativeLeaps
  def fourhundred_first_leap?(year)
    (year % 400).zero? || (year % 4).zero? && (year % 100).nonzero?
  end

  def fourhundred_first_with_equals?(year)
    ( year % 400 == 0 || year % 4 == 0 ) && year % 100 != 0
  end

  def plain_leap?(year)
    (year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?
  end

  def fourhundred_then_hundred?(year)
    (year % 400).zero? || (year % 100).nonzero? && (year % 4).zero?
  end

  def fourhundred_then_hundred_with_parenthesis?(year)
    ((year % 400).zero? || (year % 100).nonzero?) && (year % 4).zero?
  end

  def plain_leap_parenthesis?(year)
    (year % 4).zero? && ((year % 100).nonzero? || (year % 400).zero?)
  end
end

Year.extend AlternativeLeaps

years = [1999, 1996, 1900, 2000]
Benchmark.ips do |bm|
  bm.report('400 first with ==') {years.each {|y| Year.leap?(y)}}
  bm.report('400 first') {years.each {|y| Year.fourhundred_first_leap?(y)}}
  bm.report('400 then 100') {years.each {|y| Year.fourhundred_then_hundred?(y)}}
  bm.report('400 then 100, par') {years.each {|y| Year.fourhundred_then_hundred_with_parenthesis?(y)}}
  bm.report('As submitted') {years.each {|y|Year.plain_leap_parenthesis?(y)}}
  bm.report('without parenthesis') {years.each {|y| Year.plain_leap?(y)}}
  bm.compare!
end