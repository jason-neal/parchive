#/usr/bin/env sh

TODAY=$(date -d "today" +"%Y%m%d")

# Create hidden SWEETer-Cat clone
SC_DIR=".Sweeter-Cat" 

if [ ! -d "$SC_DIR" ]; then
   git clone https://github.com/DanielAndreasen/SWEETer-Cat.git "$SC_DIR"
fi 
 
cd "$SC_DIR"

# Update SWEETer-Cat repo
git pull

# Update ExoplanetEU file
python updateDB.py -n  # Update now

# Copy files to archive
cp sweetercat/data/exoplanetEU.csv ../parchive/data/exoEU_$TODAY.csv
cp sweetercat/data/sweet-cat.tsv ../parchive/data/sc_$TODAY.tsv

cd ..

# Clear any other staged files
git reset HEAD

# Commit the files
git add data/exoEU_$TODAY.csv data/sc_$TODAY.tsv
git commit -m "Archive $TODAY"

# Push to repository
git push

