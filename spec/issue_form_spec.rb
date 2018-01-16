require 'spec_helper'

describe IssueForm do
  describe "main model's attr_reader set" do
    it { expect(subject.issue.class).to be(Issue) }
  end
end
