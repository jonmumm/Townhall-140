ActiveAdmin.register Show do
  
  form do |f|
    f.inputs "Show" do
      f.input :user
      f.input :start_time, :start_year => 2011
    end
    f.buttons
  end
end
