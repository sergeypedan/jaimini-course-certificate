require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::User do

  subject { described_class.new(params) }


  let(:first_name) { "Ivan" }
  let(:last_name) { "Grozny" }
  let(:params) { { "first_name" => first_name, "last_name" => last_name } }


  shared_examples "valid instance setup" do
    it { is_expected.to be_a described_class }
    it { expect(subject.valid?).to eq true }
    it { expect(subject.errors).to be_empty }
  end

  shared_examples "invalid instance setup" do
    it { is_expected.to be_a described_class }
    it { expect(subject.valid?).to eq false }
    it { expect(subject.errors).not_to be_empty }
  end


  context "valid input" do
    context "string keys" do
      it_behaves_like "valid instance setup"
    end

    context "symbol keys" do
      let(:params) { { first_name: "Ivan", last_name: "Grozny" } }
      it_behaves_like "valid instance setup"
    end
  end


  context "invalid input" do
    context "missing key" do
      let(:params) { { "last_name" => "Grozny" } }
      it_behaves_like "invalid instance setup"
    end

    context "nil key" do
      let(:first_name) { nil }
      it_behaves_like "invalid instance setup"
    end

    context "key lower than expected" do
      let(:first_name) { 0 }
      it_behaves_like "invalid instance setup"
    end
  end

end
