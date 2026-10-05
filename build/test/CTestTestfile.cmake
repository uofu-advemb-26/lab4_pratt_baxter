# CMake generated Testfile for 
# Source directory: /Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt/test
# Build directory: /Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt/build/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(simulate_test_all "RENODE-NOTFOUND" "--disable-xwt" "--port" "-2" "--pid-file" "renode.pid" "--console" "-e" [[$ELF=@/Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt/build/test/test_all.elf; $WORKING=@/Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt; include @/Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt/test/simulate.resc; start]])
set_tests_properties(simulate_test_all PROPERTIES  _BACKTRACE_TRIPLES "/Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt/test/CMakeLists.txt;51;add_test;/Users/jaredpratt/Desktop/ECE5785/lab3_zward_jpratt/test/CMakeLists.txt;0;")
