require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::Certificate do

  subject { described_class.new(params) }

  let(:uid) { "asdf1023847102374" }
  let(:issued_on) { Date.today }
  let(:params) { { uid: uid, issued_on: issued_on } }

  it "has access to methods" do
    expect { subject.uid }.not_to raise_exception
    expect(subject).to respond_to :uid
  end

  it "has access to methods" do
    expect { subject.issued_on }.not_to raise_exception
    expect(subject).to respond_to :issued_on
  end
end
