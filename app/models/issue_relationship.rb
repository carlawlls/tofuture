class IssueRelationship < ApplicationRecord
  belongs_to :issue
  belongs_to :product
end
