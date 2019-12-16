# frozen_string_literal: true

# me = nil
# you = ' hello'
# all = nil
# me ||= you
# me ||= all
# p me

data = [[16, 4, 0.111403e4, "Product Storage", "Warehousing costs, temporary storage and so on"],
       [18, 6, 0.39289e3, "Permits and Licensing", "Business licensing, health inspection certifications if making food."]]

class Mapper < Array
  def initialize(data)
    super(data)
  end

  def map_to_keys(keys)
    into_here = []
    map! do |item|
       Hash[keys.zip(item)]
    end
    self
  end
end

p Something.new(data).map_to_keys(%i[ budget_plan_id id amount category_id category short_desc ])
