Ruby Assessment Test: We N3eD MoRe F!SH. DEPL0Y THA DEEP-FISHR-9000!
====================

                                _/|     _/|-++'
                            +  +--|    |--|--|_ |-
                         { /|__|  |/\__|  |--- |||__/
                        +---------------___[}-_===_.'____                 /\
          _         ____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _
     __..._|___--==/___]_|__|_____________________________[___\==--____,------' .7
    |                                                 LIGHTHOUSE FISHING COMPANY/
     \_________________________________________________________________________|

## Introduction

The Lighthouse Fishing Company (LFC™), with its many smart TAs, has invented a new form of fishing: Underwater fishing!!! ZOMG!

Our new protoype deep sea vessel (The DEEP-FISHR-9000) needs to be deployed ASAP...

"Why" you ask? Because the ocean is running out of fish and we need to take deep sea fishing to a whole new level baby!

Without the success of this prototype vessel, The LFC™ will *GO UNDER*! (pun very much intended)

This test should ideally take you 1hr to complete. That said, you have ~2hr to complete it.

**Please read this document very carefully before starting.**

## Tips (read in full!)

Read the `ocean.rb` code first and make sure you understand everything in there, especially the BOARD.

Note: `%w{}` is just fancy syntax that allows us to create an array of strings.

So `%w{a b c}` translates to `['a', 'b', 'c']`

If you have questions about what tests are expecting, feel free to ask.

The test file names describe what is being implemented.

Run `bundle install` to get started.

Run `rake -T` to get a list of all the rake commands you can run.

The CONSTANTS (eg: `MAX_DEPTH`) are just variables. You should use them instead of hardcoding those values. Feel free to define others.

Remember to just define `attr_accessor` for each of your instance variables to start. Since these define getter and setter (reader and writer) methods for each of your instance variables, don't redefine those methods manually.

## Your Mission

Run each set of tests (specs) as a rake task from the project's root directory via command line: `rake spec:01`.

The task will will output the results of the test and initially we will see a bunch of failing tests.

Your goal is the make all the tests pass, before proceeding onto the next step.

**Steps:**

1. Read the CODE for the spec file that you ran
2. Understand what tests it contains and what each test in that file is expecting
3. Start implementing your code to satisify each test
4. Run the test suite using the same `rake` task, to ensure that you are seeing more and more passing tests.
5. Repeat steps 1 through 4 until all tests pass for that suite.

Once all the tests are passing for that suite, run the next suite.
Example: `rake spec:02`

Use `rake -T` to see all the rake tasks you can run.

When you are done implementing all the code, you can simply run `rake` to run all the tests at once, and make sure everything is working as expected.

## Marking

Even if you make all the tests pass, you may lose marks for incorrectly implementing the solution (eg: incorrect use of OOP).

This test is created such that there are indeed correct right ways to implement your app, and incorrect ways.

You can also lose marks for bad form. Some Examples of bad form include:
* Improper or confusing naming of variables, methods, etc.
* Improper indentation
* Overly verbose code that could be implemented much more simply in Ruby
* Not writing code in the "Ruby Way". (Example: using camel casing for variable or method names instead of underscores)

**Note:** Hard coding the behavior of a method to simply make the current tests pass but not actually fulfilling the goal/responsibility of the method will *not* count as a valid solution, warranting no part marks at all.

### Mark Allocation:

01. 15%
02. 10%
03. 10%
04. 10%
05. 20%
06. 20%
07. 15%
08. 10% (Bonus)
09. 10% (Bonus)

## Other Important Notes:

* Do not modify the code in the `spec` folder
* The tests will require you to create new classes as you progress. These will need to be created in the same folder as `robot.rb`: the `lib` folder
* You **are allowed** to google around
* Please do not create a public repo nor share your work in any other way with anyone during the test
* This test is intended to take ~2hr to complete
