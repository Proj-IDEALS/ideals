Feature: Entity view page should contain the name of the entity and its description
    Users need to see the details for an entity
  
    Scenario: Theory view page should contain the name and description of theory
        Given the following theories exist:
        | name      | description |
        | Theory 1  | Desc1       |

#	When theory with name="Theory 1" is visited
	When theory with name="Theory 1" is visited
        Then I should see "Theory 1"
        Then I should see "Desc1"

    Scenario: Theory view page should contain the name and "No description provided" for a theory without a description
        Given the following theories exist:
        | name      | description |
        | Theory 1  |	          |

	When theory with name="Theory 1" is visited
        Then I should see "Theory 1"
        Then I should see "No description provided"

    Scenario: Assumption view page should contain the name and description of assumption
        Given the following assumptions exist:
        | name     	 | description |
        | Assumption 1	| Desc1       |

	When assumption with name="Assumption 1" is visited
        Then I should see "Assumption 1"
        Then I should see "Desc1"

    Scenario: Assumption view page should contain the name and "No description provided" for a assumption without a description
 
        Given the following assumptions exist:
        | name     	 | description |
        | Assumption 1	|	        |

	When assumption with name="Assumption 1" is visited
        Then I should see "Assumption 1"
        Then I should see "No description provided"

    Scenario: Practice view page should contain the name and description of practice
        Given the following practices exist:
        | name     	 | description |
        | Practice 1 	 | Desc1       |

	When practice with name="Practice 1" is visited
        Then I should see "Practice 1"
        Then I should see "Desc1"

    Scenario: Practice view page should contain the name and "No description provided" for a practice without a description
        Given the following practices exist:
        | name     	 | description |
        | Practice 1 	 | 	       |

	When practice with name="Practice 1" is visited
        Then I should see "Practice 1"
        Then I should see "No description provided"
