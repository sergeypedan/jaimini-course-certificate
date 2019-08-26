require "date"

$user = {
  first_name: "Ivan",
  last_name:  "Grozny",
  gender:     "male"
}

$course = {
  title: "Благокурса",
  slug:  "blago",
  url:   "https://jaimini.ru/blagokurs"
}

$certificate = {
  course:   $course,
  user:     $user,
  uid:      "10237841023874",
  url:      "https://jaimini.ru/certificates/10237841023874",
  issued_on: Date.today
}
