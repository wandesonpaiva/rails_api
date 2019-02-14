class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones, allow_destroy: true

  def to_br
    {
      name: self.name,
      email: self.email,
      birthdate: I18n.l(self.birthdate)
    }
  end

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  def as_json(options={})
    h = super(options)
    h[:birthdate] = I18n.l(self.birthdate) unless self.birthdate.blank?
    h
  end

=begin
  def author
    "Wandeson Paiva"
  end

  def kind_description
    self.kind.description
  end

  # define que será passado uma raiz e será passado o método author como atributo de contact
  def as_json(options={})
    super(
      root: true,
      methods: [:author, :kind_description])#,
      #include: { :kind => { only: :description} })
  end


  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end
=end

end
