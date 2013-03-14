# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(title: 'CoffeeScript(1st)',
               description: 
                %{<p>
                    CoffeeScript is JavaScript done right. It provides all of JavaScript's
              functionality wrapped in a cleaner, more succinct syntax. In the first
              book on this exciting new language, CoffeeScript guru Trevor Burnham
              shows you how to hold onto all the power and flexibility of JavaScript
              while writing clearer, cleaner, and safer code.
                  </p>}, 
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/cs.jpg'))), 
               price: 36.00)

Product.create(title: 'Programming Ruby 1.9 & 2.0(1st)',
               description:
                %{<p>
                    Ruby is the fastest growing and most exciting dynamic language
                    out there. If you need to get working programs delivered fast,
                    you should add Ruby to your toolbox.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/ruby.jpg'))), 
               price: 49.95)
Product.create(title: 'Rails Test Prescriptions(1st)',
               description: 
                %{<p>
                    <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
                    Rails applications, covering Test-Driven Development from both a
                    theoretical perspective (why to test) and from a practical perspective
                    (how to test effectively). It covers the core Rails testing tools and
                    procedures for Rails 2 and Rails 3, and introduces popular add-ons,
                    including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/rtp.jpg'))), 
               price: 34.95)
Product.create(title: 'CoffeeScript(2nd)',
               description: 
                %{<p>
                    CoffeeScript is JavaScript done right. It provides all of JavaScript's
              functionality wrapped in a cleaner, more succinct syntax. In the first
              book on this exciting new language, CoffeeScript guru Trevor Burnham
              shows you how to hold onto all the power and flexibility of JavaScript
              while writing clearer, cleaner, and safer code.
                  </p>}, 
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/cs.jpg'))), 
               price: 36.00)
Product.create(title: 'Programming Ruby 1.9 & 2.0(2nd)',
               description:
                %{<p>
                    Ruby is the fastest growing and most exciting dynamic language
                    out there. If you need to get working programs delivered fast,
                    you should add Ruby to your toolbox.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/ruby.jpg'))), 
               price: 49.95)
Product.create(title: 'Rails Test Prescriptions(2nd)',
               description: 
                %{<p>
                    <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
                    Rails applications, covering Test-Driven Development from both a
                    theoretical perspective (why to test) and from a practical perspective
                    (how to test effectively). It covers the core Rails testing tools and
                    procedures for Rails 2 and Rails 3, and introduces popular add-ons,
                    including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/rtp.jpg'))), 
               price: 34.95)
Product.create(title: 'CoffeeScript(3rd)',
               description: 
                %{<p>
                    CoffeeScript is JavaScript done right. It provides all of JavaScript's
              functionality wrapped in a cleaner, more succinct syntax. In the first
              book on this exciting new language, CoffeeScript guru Trevor Burnham
              shows you how to hold onto all the power and flexibility of JavaScript
              while writing clearer, cleaner, and safer code.
                  </p>}, 
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/cs.jpg'))), 
               price: 36.00)
Product.create(title: 'Programming Ruby 1.9 & 2.0(3rd)',
               description:
                %{<p>
                    Ruby is the fastest growing and most exciting dynamic language
                    out there. If you need to get working programs delivered fast,
                    you should add Ruby to your toolbox.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/ruby.jpg'))), 
               price: 49.95)
Product.create(title: 'Rails Test Prescriptions(3rd)',
               description: 
                %{<p>
                    <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
                    Rails applications, covering Test-Driven Development from both a
                    theoretical perspective (why to test) and from a practical perspective
                    (how to test effectively). It covers the core Rails testing tools and
                    procedures for Rails 2 and Rails 3, and introduces popular add-ons,
                    including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/rtp.jpg'))), 
               price: 34.95)
Product.create(title: 'CoffeeScript(4th)',
               description: 
                %{<p>
                    CoffeeScript is JavaScript done right. It provides all of JavaScript's
              functionality wrapped in a cleaner, more succinct syntax. In the first
              book on this exciting new language, CoffeeScript guru Trevor Burnham
              shows you how to hold onto all the power and flexibility of JavaScript
              while writing clearer, cleaner, and safer code.
                  </p>}, 
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/cs.jpg'))), 
               price: 36.00)
Product.create(title: 'Programming Ruby 1.9 & 2.0(4th)',
               description:
                %{<p>
                    Ruby is the fastest growing and most exciting dynamic language
                    out there. If you need to get working programs delivered fast,
                    you should add Ruby to your toolbox.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/ruby.jpg'))), 
               price: 49.95)
Product.create(title: 'Rails Test Prescriptions(4th)',
               description: 
                %{<p>
                    <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
                    Rails applications, covering Test-Driven Development from both a
                    theoretical perspective (why to test) and from a practical perspective
                    (how to test effectively). It covers the core Rails testing tools and
                    procedures for Rails 2 and Rails 3, and introduces popular add-ons,
                    including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
                  </p>},
               image_url: (File.open(File.join(Rails.root, '/app/assets/images/rtp.jpg'))), 
               price: 34.95)