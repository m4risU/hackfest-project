ActiveAdmin.register Route do

  form :partial => "form"

  show :title => :name do |route|
    render :partial => "locations"
  end

  sidebar :help do
    ul do
      li "First Line of Help"
    end
  end

end
