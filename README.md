# parchive (parameter archive)

The goal of this is to have copies of the SWEET-cat database (and others) at certian points in time.



To check for any trends or changes in the parametes over time.


Instructions:
To archive a certian point.
- Go to or clone the [SWEETer-CAT](https://github.com/DanielAndreasen/SWEETer-Cat) repository
- git pull   # To update the Sweeter-Cat repo
Chose a point in time to backup. A specific commit or use `git checkout 'master@{2018-04-01}'`
- cp ../SWEETer-CAT/sweetcat/data/exoplanetEU.csv data/exoEU_{date}.csv
- cp ../SWEETer-CAT/sweetcat/data/sweet-cat.tsv data/sc_{date}.tsv


TODO:
- Automated archiving cron job. Maybe see https://thoughtsimproved.wordpress.com/2015/08/17/self-updating-git-repos/
- Auto-commiting

