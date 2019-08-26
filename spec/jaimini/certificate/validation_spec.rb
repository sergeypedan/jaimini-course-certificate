# require "pry"
require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::Certificate do

  subject { described_class.new(params) }

  let(:id) { 5 }
  let(:uid) { "asdf1023847102374" }
  let(:issued_on) { Date.today }
  let(:params) { { "id" => id, "uid" => uid, "issued_on" => issued_on } }


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
    context "as is" do
      it_behaves_like "valid instance setup"
    end

    context "id with coersion" do
      let(:id) { "2" }
      it_behaves_like "valid instance setup"
    end

    context "date with coersion" do
      let(:issued_on) { "2019-01-30" }
      it_behaves_like "valid instance setup"
    end
  end


  context "invalid input" do
    context "missing key" do
      let(:params) { { "uid" => uid, "issued_on" => issued_on } }
      it_behaves_like "invalid instance setup"
    end

    context "nil key" do
      let(:uid) { nil }
      it_behaves_like "invalid instance setup"
    end

    context "value not fit for coersion" do
      let(:issued_on) { "2019-01-32" }
      it_behaves_like "invalid instance setup"
    end
  end

end
