require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::Certificate do

  subject { described_class.new(params) }

  let(:params) { $certificate }

  it "has access to methods" do
    expect { subject.url }.not_to raise_exception
    expect(subject).to respond_to :url
  end

  it "has access to methods" do
    expect { subject.issued_on }.not_to raise_exception
    expect(subject).to respond_to :issued_on
  end
end
