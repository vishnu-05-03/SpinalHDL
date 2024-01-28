# To change the name of the project in the template ```MySpinalProject```
- in ```MySpinalProject``` directory in ```build.sbt```, ```build.sc``` change : (projectname -> new_name).
- in ```MySpinalProject/hw/spinal/``` change : (projectname -> new_name_directory)
- in ```MySpinalProject/hw/spinal/projectname``` in ```Config.scala```, ```MyTopLevel.scala```, ```MyTopLevelFormal.scala``` and ```MyTopLevelSim.scala``` change : (package projectname -> package new_name) in starting.

# For compiling in single command make these changes
- replace mylib with the new_name_directory ```sbt "~ runMain mylib.MyTopLevelVerilog"``` -> ```sbt "~ runMain new_name_directory.MyTopLevelVerilog"```