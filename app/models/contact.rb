class Contact < ApplicationRecord
  belongs_to :kind

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
=end

end
