# Robot

## Version 1

This version can be found in the `non_oo_version` folder.

1. Run `ruby robot.rb` from the console to execute some sample commands
1. Or start `irb`, then `require_relative "robot"` and provide your own commands in the following form:
* place 1, 1, EAST
* move
* report

To execute test scripts, run `ruby robot_test.rb`

## Version 2 (OO)

1. Run `ruby robot_v2.rb` from the console to execute some sample commands
1. Or start `irb`, then `require_relative "robot_v2"` and provide your own commands in the following form:
* initialize new robot - `robot = Robot.new`
* place robot - `robot.place 1, 1, EAST`
* move robot - `robot.move`
* display report - `robot.report`

To execute test scripts, run `ruby test/robot_v2_test.rb` or `ruby test/board_test.rb`
