ActiveAdmin.register Location do
  scope :full, :default => true

  form :partial => "form"
  show :title => :name

  index do
    default_actions
    column :name
    column :routes do |loc|
      loc.routes.map(&:name).join(", ")
    end
  end

end