require 'spec_helper'

describe Formify::ConfigurationMethods do
  let(:model) { class User; end; User; }

  let(:form) do
    class UserForm; end;
    UserForm.include(described_class)
    UserForm
  end

  describe ".main_model, .get_main_model" do
    context "explicit main model set" do
      before do
        form.main_model(model)
      end

      it { expect(form.get_main_model).to eq("User") }
    end

    context "main model inference" do
      it { expect(form.get_main_model).to eq("User") }
    end
  end

  describe "activemodel included" do
    it { expect(form.new).to respond_to(:persisted?) }
  end
end
