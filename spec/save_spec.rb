require 'spec_helper'

describe Formify::Save do
  subject { Class.new { include Formify::Save }.new }
  let(:model_instance) { double(:model_instance) }

  describe "#save" do
    before do
      allow(subject).to receive(:main_model_snaked).and_return(:model_name)
      allow(subject).to receive(:model_name).and_return(model_instance)
    end

    context "when validate flag is true" do
      context "and form is valid" do
        it do
          expect(subject).to receive(:valid?).and_return(true)
          expect(subject).to receive(:before_save)
          expect(model_instance).to receive(:save).and_return(true)
          expect(subject).to receive(:after_save)

          expect(subject.save).to eq(true)
        end
      end

      context "and form is invalid" do
        it do
          expect(subject).to receive(:valid?).and_return(false)

          expect(subject.save).to eq(false)
        end
      end
    end

    context "when validate flag is false" do
      context "and model instance was saved" do
        it do
          expect(subject).to receive(:before_save)
          expect(model_instance).to receive(:save).and_return(true)
          expect(subject).to receive(:after_save)

          expect(subject.save(validate: false)).to eq(true)
        end
      end

      context "and model instance was saved" do
        it do
          expect(subject).to receive(:before_save)
          expect(model_instance).to receive(:save).and_return(false)
          expect(subject).to receive(:after_save)

          expect(subject.save(validate: false)).to eq(false)
        end
      end
    end
  end
end
