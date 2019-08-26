desc "Tests PDF creation"

task :test_1 do
  require "pry"

  wd = "/Users/sergey/Downloads/"

  certificate = Jaimini::CourseCertificates::Certificate.new({ id: 5, uid: "1023847103471", issued_on: Date.today })
  user        = Jaimini::CourseCertificates::User.new({ id: 5, first_name: "Sergey", last_name: "Pedan" })
  course      = Jaimini::CourseCertificates::Course.new({ id: 5, slug: "blagokurs", title: "Благокурс" })
  pdf_meta    = {
    Author:       "Анита Педан",
    CreationDate: Time.now,
    Creator:      "Jaimini",
    Keywords:     "астрология васту джйотиш сертификат обучение курс",
    Producer:     "jaimini.ru website",
    Subject:      "Название курса",
    Title:        "Сертификат о прохождении курса"
  }

  builder = Jaimini::CourseCertificates::PDFBuilder.new(
    certificate: certificate,
    course: course,
    user: user,
    pdf_meta: pdf_meta,
    background: { image: "#{wd}/bg.jpg", dpi: 300 }
  )

  builder.save_as_file(path: "#{wd}/certificate.pdf")
end
