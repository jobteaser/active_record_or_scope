module ActiveRecordOrScope
  class Railtie < Rails::Railtie
    initializer "railtie.configure_rails_initialization" do
      ActiveRecord::Relation.send(:include, ActiveRecordOrScope::Relation)
      ActiveRecord::Querying.send(:include, ActiveRecordOrScope::Querying)
    end
  end
end
