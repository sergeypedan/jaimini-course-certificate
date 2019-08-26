require "jaimini/course_certificates/user"

RSpec.describe Jaimini::CourseCertificates::PDFBuilder do

  subject { described_class.new(certificate: certificate, course: course, user: user) }

  let(:course)      { Jaimini::CourseCertificates::Course.new({ id: 5, slug: "1023874", title: "My new course" }) }
  let(:user)        { Jaimini::CourseCertificates::User.new({ id: 5, first_name: "Ivan", last_name: "Grozny" }) }
  let(:certificate) { Jaimini::CourseCertificates::Certificate.new({ id: 5, uid: "102384734", issued_on: Date.today }) }

end
