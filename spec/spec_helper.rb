$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record_or_scope'
require 'rails'
require 'active_record'
require 'nulldb'

ActiveRecord::Base.establish_connection(
  adapter: :nulldb,
  schema: File.join(File.dirname(File.expand_path(__FILE__)), 'support', 'schema.rb')
)

# Railtie is not called since there is no rails app. Calling it manually
ActiveRecord::Relation.send(:include, ActiveRecordOrScope::Relation)
ActiveRecord::Querying.send(:include, ActiveRecordOrScope::Querying)

class MockModel < ActiveRecord::Base
  def self.active
    where(status: 'active')
  end

  def self.drafts
    where(status: 'draft')
  end
end
