#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'exho/console'

class ExhoParser

  @@url = "https://raw.github.com/blueberryos/exhorepo/master/repository.xml"

  attr_accessor :homedir, :exhodir
  def getrepodata
    console = Console.new(true)
    console.toInfoConsole "Downloading repository metadata..."
    repodata = open(@@url) { |f| f.read }
  end

  def chdirandcreateexho homedir
    console = Console.new(true)
    begin
      Dir.chdir homedir
      @exhodir = homedir+"/.exho"
      if File.directory? @exhodir
        Dir.chdir @exhodir
      else
        Dir.mkdir ".exho"
        Dir.chdir ".exho"
      end
    rescue Exception => ex
    console.toErrorConsole ex.message
    end
  end

  def controldir
    console = Console.new(true)
    begin
      @homedir = `echo $HOME`.chomp!
      if @homedir == ""
        console.toErrorConsole "Couldn't defined home directory using /opt"
        @homedir = "/opt"
        if File.directory? @homedir
          chdirandcreateexho @homedir
        else
          Dir.mkdir @homedir
          console.toInfoConsole "/opt created"
          chdirandcreateexho @homedir
        end
      end
      if File.directory? @homedir
        chdirandcreateexho @homedir
      else
        raise RuntimeError, "Your home directory couldn't found"
      end
    rescue Exception => ex
    console.toErrorConsole ex.message
    end
  end

  def write2disk
    console = Console.new(true)
    begin
      if @exhodir == nil then
        controldir
        repofd = @exhodir + "/repository.xml"
        if not File.exist? repofd
          repodata = getrepodata
          File.open(repofd, "w") { |f| f.write(repodata)}
        else
          File.unlink repofd
          repodata = getrepodata
          File.open(repofd, "w") { |f| f.write(repodata)}
        end
      else
        repofd = @exhodir + "/repository.xml"
        if File.exist? repofd
          File.unlink repofd
        end
        repodata = getrepodata
        File.open(repofd, "w") { |f| f.write(repodata)}
      end
    rescue Exception => ex
    console.toErrorConsole ex.message
    end
  end

  def parser
    #TODO: total execution code for parsing
  end

end