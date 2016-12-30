require 'spec_helper'
require 'active_record'

RSpec.describe ActiveRecordOrScope do
  it 'has a version number' do
    expect(ActiveRecordOrScope::VERSION).not_to be nil
  end

  describe 'query generation' do
    it 'handles manual queries' do
      expect(
        MockModel.where_any(
          MockModel.where(title: 'foo'),
          MockModel.where(title: 'bar')
        ).to_sql
      ).to eq "SELECT mock_models.* FROM mock_models WHERE ((mock_models.title = 'foo') OR (mock_models.title = 'bar'))"
    end

    it 'handles scopes' do
      expect(
        MockModel.where_any(
          :active,
          :drafts
        ).to_sql
      ).to eq "SELECT mock_models.* FROM mock_models WHERE ((mock_models.status = 'active') OR (mock_models.status = 'draft'))"
    end

    it 'handles chaining with AND' do
      expect(
        MockModel.where_any(
          :active,
          :drafts
        ).where(title: 'foo').to_sql
      ).to eq "SELECT mock_models.* FROM mock_models WHERE ((mock_models.status = 'active') OR (mock_models.status = 'draft')) AND mock_models.title = 'foo'"
    end
  end
end
