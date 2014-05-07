#!/usr/bin/env ruby -W0 

require 'rubygems'
require 'json'
require 'pp'

mahout_in = ARGV[0]
document = ARGV[1]

id = File.basename(document)
doc = JSON.parse(File.read(document))

file = File.open File.join(mahout_in,id), "w"
file.puts doc['body']
file.close

