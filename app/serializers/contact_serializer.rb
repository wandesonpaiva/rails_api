class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind
  has_many :phones
  has_one :address

  def attributes(*args)
    h = super(*args)
    # pt-BR ---> h[:birthdate] = (I18n.l(object.birthdate))
    h[:birthdate] = object.birthdate.to_time.iso8601
    h
  end
end
