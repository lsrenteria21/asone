require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
    
    def setup
        @athlete = Athlete.new(athletename: "John", email: "john@example.com")
    end
    
    
    test "athlete should be valid" do
        assert @athlete.valid?
    end
    
    
    test "athletename should be present" do
       @athlete.athletename = " " 
       assert_not @athlete.valid?
    end
    
    
    test "athletename should not be too long" do
       @athlete.athletename = "a" * 41
       assert_not @athlete.valid?
    end
    
    
    test "athletename should not be too short" do
        @athlete.athletename = "aa"
        assert_not @athlete.valid?
    end
    
    
    test "email should be present" do
       @athlete.email = " "
       assert_not @athlete.valid?
    end
    
    
    test "email length should be within bounds" do
       @athlete.email = "a" * 101 + "@example.com"
       assert_not @athlete.valid?
    end
    
    
    test "email address should be unique" do
       dup_athlete = @athlete.dup
       dup_athlete.email = @athlete.email.upcase
       @athlete.save
       assert_not dup_athlete.valid?
    end
    
    test "email validation should accept valid addresses" do
       valid_addresses = %w[user@eee.com R_TDD-DS@eee.com.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
       valid_addresses.each do |va|
           @athlete.email = va 
           assert @athlete.valid?, '#{va.inspect} should be valid'
       end
    end
    
    
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_eee.org user.name@example eee@i_am_.com foo@ee+aar.com]
        invalid_addresses.each do |ia|
            @athlete.email = ia
            assert_not @athlete.valid? '#{ia.inspect} should be invalid' 
        end
    end
    
end
