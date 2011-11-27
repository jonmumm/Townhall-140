ActiveAdmin.register User do
  index do
    column :email
    column :admin
    default_actions
  end

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :admin
    end
    f.buttons
  end
  
end
