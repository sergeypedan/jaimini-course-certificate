# frozen_string_literal: true

module Jaimini
  module CourseCertificates
    module MonthsLocalization

      MONTHS = {
        1 => {
          nominative: "январь",
          genitive:   "января"
        },
        2 => {
          nominative: "февраль",
          genitive:   "февраля"
        },
        3 => {
          nominative: "март",
          genitive:   "марта"
        },
        4 => {
          nominative: "апрель",
          genitive:   "апреля"
        },
        5 => {
          nominative: "май",
          genitive:   "мая"
        },
        6 => {
          nominative: "июнь",
          genitive:   "июня"
        },
        7 => {
          nominative: "июль",
          genitive:   "июля"
        },
        8 => {
          nominative: "август",
          genitive:   "августа"
        },
        9 => {
          nominative: "сентябрь",
          genitive:   "сентября"
        },
        10 => {
          nominative: "октябрь",
          genitive:   "октября"
        },
        11 => {
          nominative: "ноябрь",
          genitive:   "ноября"
        },
        12 => {
          nominative: "декабрь",
          genitive:   "декабря"
        }
      }

      def self.month_name(month_number, noun_case: :nominative)
        fail ArgumentError, "`month_number` invalid" unless (1..12).include? month_number
        fail ArgumentError, "`noun_case` invalid"    unless [:nominative, :genitive].include? noun_case
        MONTHS[month_number][noun_case]
      end
    end
  end
end
