module ActiveRecordOrScope
  module Relation
    def where_any(*scopes)
      # Handle both scopes and scope names
      scopes = scopes.map { |s| s.is_a?(Symbol) ? model.send(s) : s }

      subscope = scopes.
        map { |s| s.arel.constraints.reduce(:and) }.
        map { |cc| Arel::Nodes::Grouping.new(cc) }.
        reduce(:or)

      where(subscope).tap { |sc| sc.bind_values += scopes.flat_map(&:bind_values) }
    end
  end
end
