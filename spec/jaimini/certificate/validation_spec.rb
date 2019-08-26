# require "pry"
require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::Certificate do

  subject { described_class.new(params) }

  let(:params) { $certificate }


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

    context "date with coersion" do
      before { params[:issued_on] = "2019-01-30" }
      it_behaves_like "valid instance setup"
    end
  end


  context "invalid input" do
    context "missing key" do
      let(:params) { { "issued_on" => Date.today } }
      it_behaves_like "invalid instance setup"
    end

    context "value not fit for coersion" do
      let(:issued_on) { "2019-01-32" }
      it_behaves_like "invalid instance setup"
    end
  end

end
