# Robot

1. Run `ruby robot.rb` from the console to execute some sample commands
1. Or start `irb`, then `require_relative "robot"` and provide your own commands in the following form:
* initialize new robot - `robot = Robot.new`
* place robot - `robot.place 1, 1, EAST`
* move robot - `robot.move`
* display report - `robot.report`

To execute test scripts, run `ruby test/robot_test.rb` or `ruby test/board_test.rb`
