{:user 
 {:plugins [[lein-try "0.4.3"]
            [lein-pprint "1.1.1"] ]
  :dependencies [[pjstadig/humane-test-output "0.7.1"]]
  :injections [(require 'pjstadig.humane-test-output)
               (pjstadig.humane-test-output/activate!)]}}
                  
