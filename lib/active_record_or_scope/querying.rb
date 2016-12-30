module ActiveRecordOrScope
  module Querying
    def self.included(base)
      base.delegate :where_any, to: :all
    end
  end
end
