FactoryGirl.define do
  factory :product do
    title 'Programming Ruby 1.9'
    description %{
      Ruby is the fastest growing and most exciting dynamic language out there.
      If you need to get working programs delivered fast, you should add Ruby to your toolbox.
    }
    price 49.50
    image_url 'ruby.png'
  end
end
