# My test class
DEBIT = /^Reweigh$/
CREDIT = /^Reweigh Credit$/

class Some
  def doit(val1, val2)
    return nil unless val1 =~ DEBIT || val2 =~ CREDIT
    50
  end
  def doit2(val1, val2)
    50 if val1 =~ DEBIT || val2 =~ CREDIT
  end

  def found?(param)
    sample = <<-FOO
Reweigh
    FOO
    p sample
    sample =~ param
  end

  def whatyougot
    label = "me"
    if 1 > 1
      "salmon"
    end
  end
end

obj = Some.new

# o
p obj.found?(DEBIT)

# found both mathches
p obj.doit('Reweigh', '') == obj.doit2('Reweigh', '')

p obj.whatyougot
