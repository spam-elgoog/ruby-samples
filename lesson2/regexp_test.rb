require 'minitest/autorun'

class RegexpTest < Minitest::Test
  REFERENCE_REGEX = /^ESAU\d+\/Order\s\#\w+$/
  REF = /^(?<ref>\d+)\/Order\s\#\w+$/
  def test_regex
    sample = 'ESAU29867099/Order #1590'
    p sample.match(/^ESAU\d+\/Order\s\#\w+$/)
    p sample.match(/^(?<ref>ESAU\d+)\/Order\s\#\w+$/)[:ref]
    p $LAST_MATCH_INFO
    p sample.split('/')[0]
  end
end
