require 'helper'
require 'exho/parser'

class TestParser < Test::Unit::TestCase
  context 'parser' do

    setup do
      @exhoparser = ExhoParser.new
    end

    should "[controldir] Controls the homedir if exist, if not then use /opt as basedir" do
      assert_block("[controldir] error") do
        @exhoparser.controldir
      end
    end

    should "[write2disk] repository metadata must be written to disk [exhodir not known]" do
      assert_block("[controldir] error") do
        @exhoparser.write2disk
      end
    end

    should "[write2disk] repository metadata must be written to disk [exhodir known]" do
      assert_block("[controldir] error") do
        @exhoparser.controldir
        @exhoparser.write2disk
      end
    end
  end
end
