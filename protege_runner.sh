#!/bin/sh
export DISPLAY=:0

# Set the Java AWT window manager non-reparenting environment variable
export _JAVA_AWT_WM_NONREPARENTING=1

# Navigate to the Protege Linux distribution directory
cd ~/protege/protege-desktop/target/protege-5.6.3-linux/Protege-5.6.3

# Modify the run.sh script to use the Java installation from the environment
sed -i 's|^\[ -z "$EFFECTIVE_JAVA_HOME" \] && EFFECTIVE_JAVA_HOME="jre"$|EFFECTIVE_JAVA_HOME=$JAVA_HOME|' run.sh

# Execute the run.sh script
./run.sh
