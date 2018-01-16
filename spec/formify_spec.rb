require 'spec_helper'

describe Formify do
  it 'has a version number' do
    expect(Formify::VERSION).not_to be nil
  end

  let!(:model) { class SuperUser; end; SuperUser }
  let!(:form) { class SuperUserForm; end; SuperUserForm }
  let(:model_instance) { model.new }
  let(:form_instance) do
    form_included = form.include(described_class)
    form_included.new(model_instance)
  end

  before do
    allow(model).to receive(:columns) { [] }
  end

  describe ".new" do
    it "creates instance variable and attr_reader" do
      expect(form_instance.super_user).to eq(model_instance)
    end
  end

  describe "#to_model" do
    it { expect(form_instance.to_model).to eq(model_instance) }
  end
end
