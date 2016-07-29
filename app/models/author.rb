class Author < ActiveRecord::Base

  validates_presence_of :last_name
  validates_uniqueness_of :last_name

  has_many :articles

  def first_name_initial
    if first_name
      first_name[0].mb_chars.upcase.to_s
    end
  end

  def patronymic_initial
    if patronymic
      patronymic[0].mb_chars.upcase.to_s
    end
  end

  def display_name
    first_letter = first_name_initial.blank? ? '' : "#{first_name_initial}."
    patronymic_letter = patronymic_initial.blank? ? '' : "#{patronymic_initial}."
    "#{last_name} #{first_letter}#{patronymic_letter}"
  end

end
