ActiveAdmin.register Location do
  scope :full, :default => true

  form :partial => "form"
  show :title => :name

end