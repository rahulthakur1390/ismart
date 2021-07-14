#!/usr/bin/env ruby

require 'byebug'

class Readlog
  attr_accessor :log, :sorted_hash, :visit_hash, :unique_hash
  def initialize(filename)
    @log = File.readlines(filename)
  end

  def result
    arrange_log
    cal_visits
    sort_values
    display_visit
    display_uniq_visit
  end
  
  def arrange_log
    @sorted_hash = {}
    @log.each do |line|
      split_record = line.split(' ')
      if @sorted_hash.key?(split_record[0])
        @sorted_hash[split_record[0]].push(split_record[1])
      else
        @sorted_hash[split_record[0]] = [split_record[1]]
      end
    end
  end

  def cal_visits
    @visit_hash = {}
    @unique_hash = {}
    @sorted_hash.each do |key, value|
      @visit_hash[key] = value.count
      @unique_hash[key] = value.uniq.count
    end    
  end

  def sort_values
    @visit_hash = @visit_hash.sort_by {|_key, value| value}.reverse.to_h
    @unique_hash = @unique_hash.sort_by {|_key, value| value}.reverse.to_h    
  end
  
  def display_visit
    puts 'list of webpages with most page views ordered from most pages views to less page views'
    puts "================================================="
      @visit_hash.each do |key, value|
        puts "#{key}  #{value} visits"
      end
    puts "================================================="    
  end

  def display_uniq_visit
    puts 'list of webpages with most unique page views also ordered'
    puts "================================================="
      @unique_hash.each do |key, value|
        puts "#{key}  #{value} unique views"
      end
    puts "================================================="    
  end

 end

# comment out below line when you run test cases.
Readlog.new(ARGV[0]).result

