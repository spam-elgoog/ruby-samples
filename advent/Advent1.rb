@total = 0

def load_file
  File.read('./data1.txt')
end
data = load_file.lines(chomp: true)

def calc(mass)
  ((mass/3.0).floor.to_int > 2) ? (mass/3.0).floor.to_int - 2 : 0
end

def doit(masss)
  masss = calc(masss)
  @total += masss
  doit(masss) if masss.positive?
end

data.each do |num|
 doit(num.to_i)
end

p @total


