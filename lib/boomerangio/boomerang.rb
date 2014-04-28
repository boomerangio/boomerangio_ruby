require 'ostruct'

module Boomerangio
  class Boomerang
  	
  	def initialize(record)
  	  if record.is_a?(Array)
  	    record.map {|r| OpentStruct.new(r)}
  	  else
  	    OpentStruct.new(r)
  	  end
  	end
  	
  end
end