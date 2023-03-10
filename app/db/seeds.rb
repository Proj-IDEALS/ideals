# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
more_theories = [
    {:name => 'Cognitive Constructive Theory', :description => '',
      },
    {:name => 'Social Constructive Theory', :description => '',
      },
    {:name => 'Situated Learning Theory', :description => '',
      },
    {:name => 'Critical Pedagogy', :description => '',
      },
    {:name => 'Transformative Learning theory', :description => '',

    }
    
    ]
    Theory.create!(more_theories)

more_assumptions = [
    {:name => 'learning is construction of knowledge', :description => '',
    },
    {:name => 'learning requires scaffolding', :description => '',
    },
    {:name => 'learning is a generative process', :description => '',
    },
    {:name => 'learning occurs within a zone of proximal development', :description => '',
    },
    {:name => 'learning requires interpretation', :description => '',
    },
    {:name => 'reality is created by joint experiences', :description => '',
    },
    {:name => 'learning is not merely individual', :description => '',
    },
    {:name => 'learning is in action, activity interaction', :description => '',
    },
   ]
   Assumption.create!(more_assumptions)

more_practices = [
    {:name => 'concept mapping', :description => '',
    },
    {:name => 'individual problem solving', :description => '',
    },
    {:name => 'think pair share', :description => '',
    },
    {:name => 'case-based learning', :description => '',
    },
    {:name => 'watching', :description => '',
    },
    {:name => 'reading', :description => '',
    },
    {:name => 'listening', :description => '',
    },
    {:name => 'in-class observation', :description => '',
    },
   ]
   Practice.create!(more_practices)
