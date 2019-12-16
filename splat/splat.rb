class Splat
  def self.any_arg(*args)
    need_three(*args)
  end
  def self.need_three(*pops)
    p *pops
  end
end

arr1 = ["first", "second", "third"]
arr2 = [99,89,88]

Splat.any_arg(arr1)