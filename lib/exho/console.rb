#!/usr/bin/env ruby


class Console

  @@debug_mode = false
  
  def initialize debug
    @@debug_mode = debug
  end

  def toInfoConsole str
    if @@debug_mode == true
      puts "[ INFO ] : " + str
    end
  end

  def toErrorConsole str
    if @@debug_mode == true
      puts "[ ERROR ] : " + str
    end
  end

  def toWarnConsole str
    if @@debug_mode == true
      puts "[ WARN ] : " + str
    end
  end
  
end