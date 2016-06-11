class Author < ActiveRecord::Base

  validates_presence_of :last_name
  validates_uniqueness_of :last_name

  def first_name_initial
    if first_name[0]
      first_name[0].mb_chars.upcase.to_s
    end
  end

  def patronymic_initial
    if patronymic[0]
      patronymic[0].mb_chars.upcase.to_s
    end
  end
end
