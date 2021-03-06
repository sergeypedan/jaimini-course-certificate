desc "Tests PDF text"

task :test_3 do
  wd = "/Users/sergey/Downloads"

  certificate = {
    issued_on: Date.today,
    uid:       "1023847103471",
    url:       "https://jaimini.ru/certificates/1023847103471",
    course: {
      title: "Онлайн курс «Ведическая астрология с нуля»",
      url:   "https://jaimini.ru/courses/blagokurs"
    },
    user: {
      first_name: "Арсений",
      last_name:  "Константинопольский",
      gender:     "male"
    }
  }

  pdf_meta = {
    Author:       "Анита Педан",
    CreationDate: Date.today.strftime("%F"),
    Creator:      "Jaimini",
    Keywords:     "астрология васту джйотиш сертификат обучение курс",
    Producer:     "jaimini.ru website",
    Subject:      "Название курса",
    Title:        "Сертификат о прохождении курса"
  }

  builder = Jaimini::CourseCertificates::PDFBuilder.new(
    certificate: certificate,
    pdf_meta: pdf_meta
  )

  builder.save_as_file(path: "#{wd}/certificate.pdf")
end
