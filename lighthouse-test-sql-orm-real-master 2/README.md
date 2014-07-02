Assessment Test 2 - ActiveRecord & SQL
==============

## Models

We're modelling a simple hotel guest management software. There are two models, `Booking` and `Suite` in the models folder. Use the `db/schema.rb` for reference about their columns.

## ActiveRecord Queries

**Important Note:**
Your queries (filtering a subset of data, sorting, etc) should leverage the database (by using ActiveRecord calls) instead of performing the filters using Ruby's methods (such as`sort`, `select` or `detect`).

## Questions

There are 11 questions, 3 of which are bonus, totalling 120%.
Run each test using the `rspec` command (eg: `rspec spec/01.rb`) and make it pass.

If you'd like to run a **specific** test (to drown out the noise), add the line number. Example:

    rspec spec/01.rb:13

**Important Note**: Questions/tests that are imperative to make pass (are dependencies) for the rest of the questions are marked with a double star (**). In other words, you can safely skip questions that are not marked with any stars, in case you want to come back to them later.

## Mark Allocation

01. 10% **
02. 10%
03. 20%
04. 10%
05. 15%
06. 15%
07. 10%
08. 10%
09. 10% (BONUS)
10. 5% (BONUS)
11. 5% (BONUS)

## Rules (IMPORTANT)

* A mark of 80% or higher is considered a PASS.
* You are allowed to google around
* Please do not create a public repo nor share your work in any other way with anyone during the test
* This test is intended to take ~2hr to complete
* No collaboration with your peers is allowed during the test
* You will be deducted points for bad form (improper indentation, counter intuitive or confusing code, bad naming conventions, commented out code, etc)
