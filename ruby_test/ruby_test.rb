require_relative "./ruby_app"
require "test/unit"
 
class TestReadlog < Test::Unit::TestCase
   attr_accessor :log, :sorted_hash, :visit_hash, :unique_hash  
  def setup
    @log = Readlog.new('testwebserver.log')
  end

  def test_arrange_log
    assert_equal(5, @log.arrange_log.size)
  end

  def test_cal_visits
    @log.arrange_log
    assert_equal(4, @log.cal_visits.size)
  end

  def test_sort_values
    @log.arrange_log
    @log.cal_visits
    assert_equal(4, @log.sort_values.size) 
  end 
end