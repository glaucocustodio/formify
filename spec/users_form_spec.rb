require 'spec_helper'

describe UsersForm do
  let(:form_instance) { described_class.new }

  describe "main model's attr_reader set" do
    it { expect(form_instance.user.class).to be(User) }
  end

  describe "main model's attributes set" do
    it do
      User.columns.map(&:name).each do |attr|
        expect(form_instance.send(attr)).to eq(nil)
      end
    end

    it do
      form_instance.name = "John"
      expect(form_instance.name).to eq("John")
    end
  end

  describe "#params=" do
    before do
      form_instance.params = { name: "Max", company_id: 1 }
    end

    it { expect(form_instance.name).to eq("Max") }
    it { expect(form_instance.company_id).to eq(1) }
  end

  describe "#save" do
    context "valid" do
      before do
        form_instance.params = { name: "Joe", company_id: 2 }
      end

      it { expect{form_instance.save}.to change{User.count}.by(1) }

      subject { User.last }
      it { expect(subject.name).to eq("Joe") }
      it { expect(subject.company_id).to eq(2) }
    end

    context "invalid" do
      before do
        form_instance.params = { name: nil, company_id: 3 }
      end

      it { expect{form_instance.save}.to change{User.count}.by(0) }
      it do
        form_instance.save
        expect(form_instance.errors[:name]).to be_present
      end
    end
  end
end
