#/usr/bin/env sh

TODAY=$(date -d "today" +"%Y%d%m")
# Requires SWEETer-Cat repo next to parchive repo
cd ../SWEETer-Cat

# Update SWEETer-Cat repo
git pull

# Update ExoplanetEU file
python updateDB.py -n  # Update now

# Copy files to archive
cp sweetercat/data/exoplanetEU.csv ../parchive/data/exoEU_$TODAY.csv
cp sweetercat/data/sweet-cat.tsv ../parchive/data/sc_$TODAY.tsv
cd ../parchive

# Clear any other staged files
git reset HEAD

# Commit the files
git add data/exoEU_$TODAY.csv data/sc_$TODAY.tsv
git commit -m "Archive $TODAY"

# Push to repository
git push

