require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
    
    def setup
        @athlete = Athlete.create(athletename: "Lenny", email:"lenny@example.com")
       @workout = @athlete.workouts.build(name: "Out Of Breath", summary: "this is nonstop",
                  description: "3min rounds of jump rope, heavy bag, shadow boxing,
                  airdyne. After every round run 400m then straight into next round 
                  of exercise. 50min Duration" ) 
    end
    
    
    
    test "workout should be valid" do
        assert @workout.valid?
    end
    
    
    test "athlete_id should be present" do 
       @workout.athlete_id = nil
       assert_not @workout.valid?
    end
    
    
    
    test "name should be present" do 
        @workout.name = " "
        assert_not @workout.valid?
    end
    
    
    
    test "name length should not be too long" do
        @workout.name = "a" * 101
        assert_not @workout.valid?
    end
    
    
    
    test "name length should not be to short" do
        @workout.name = "aaaa"
        assert_not @workout.valid?
    end
    
    
    
    test "summary must be present" do
        @workout.summary = " "
        assert_not @workout.valid?
    end
    
    
    
    test "summary length should not be to long" do
        @workout.summary = "a" * 151
        assert_not @workout.valid?
    end
    
    
    
    test "summary length should not be too short" do
        @workout.summary = "a" * 9
        assert_not @workout.valid?
    end
    
    
    
    test "description must be present" do
        @workout.description = " "
        assert_not @workout.valid?
    end
    
    
    
    test "description should not be too long" do
        @workout.description = "a" * 501
        assert_not @workout.valid?
    end
    
    
    
    test "description should not be too short" do
        @workout.description = "a" * 19
        assert_not @workout.valid?
        
    end
    
    
    
    
end