#!/usr/bin/env sh

TODAY=$(date -d "today" +"%Y%m%d")

# Create hidden SWEETer-Cat clone
SC_DIR=".Sweeter-Cat" 

if [ ! -d "$SC_DIR" ]; then
   git clone https://github.com/DanielAndreasen/SWEETer-Cat.git "$SC_DIR"
fi 


(   # Using a subshell
    cd "$SC_DIR" || exit
    # Update SWEETer-Cat repo
    git pull
    # Update ExoplanetEU file
    python updateDB.py -n  # Update now
)   # No need for "cd .."

# Copy files to archive
cp $SC_DIR/sweetercat/data/exoplanetEU.csv ./data/exoEU_$TODAY.csv
cp $SC_DIR/sweetercat/data/sweet-cat.tsv ./data/sc_$TODAY.tsv


# Clear any other staged files
git reset HEAD

# Commit the files
git add data/exoEU_$TODAY.csv data/sc_$TODAY.tsv
git commit -m "Archive $TODAY"
git tag $TODAY

# Push to repository
git push

(   # Using a subshell
    cd "$SC_DIR" || exit
    # Restore exoplanetEU.csv to match SC repo version.
    git checkout -- sweetercat/data/exoplanetEU.csv
)   
