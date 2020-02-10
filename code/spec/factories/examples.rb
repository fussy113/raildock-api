FactoryBot.define do
  factory :examples_index_1, class: Example do
    code { "MyCode_1" }
    value { "MyValue_1" }
  end
  factory :examples_index_2, class: Example do
    code { "MyCode_2" }
    value { "MyValue_2" }
  end
  factory :examples_show, class: Example do
    code { "MyCode_show" }
    value { "MyValue_show" }
  end
  factory :examples_create, class: Example do
    code { "MyCode_create" }
    value { "MyValue_create" }
  end
  factory :examples_update_before, class: Example do
    code { "MyCode_before" }
    value { "MyValue_before" }
  end
  factory :examples_update_after, class: Example do
    code { "MyCode_after" }
    value { "MyValue_after" }
  end
  factory :examples_delete, class: Example do
    code { "MyCode_act" }
    value { "MyValue_act" }
  end
end
