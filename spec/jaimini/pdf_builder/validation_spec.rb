require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::PDFBuilder do

  subject { described_class.new(certificate: certificate, course: course, user: user, pdf_meta: {}) }

  let(:course)      { { slug: "1023874", title: "My new course" } }
  let(:user)        { { first_name: "Ivan", last_name: "Grozny", gender: "male" } }
  let(:certificate) { { uid: "102384734", issued_on: Date.today } }


  shared_examples "valid instance setup" do
    it { is_expected.to be_a described_class }
  end

  shared_examples "invalid instance setup" do
    it { expect { subject }.to raise_exception ArgumentError }
  end


  context "valid input" do
    it_behaves_like "valid instance setup"
  end


  context "invalid input" do
    context "An internal record misses a key" do
      let(:certificate) { { uid: "102384734" } }
      it_behaves_like "invalid instance setup"
    end

    context "An internal record is nil" do
      let(:certificate) { nil }
      it_behaves_like "invalid instance setup"
    end
  end

end
