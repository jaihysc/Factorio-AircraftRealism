#!/bin/bash
# Zips the contents of the mod to be uploaded with the name of the current folder

# NOTE! Factorio requires mods to have specific naming, thus the current folder
# (whose name is used) must be named appropriately: e.g., AircraftRealism_1.4.1
# Output is "currentFolderName.zip/currentFoldername/<contents>"

cd "$(dirname "$0")" || exit 1

foldername="$(basename "$PWD")"
filename="${foldername}.zip"

cd .. || exit 1 # Include the current directory (contains mod name) as part of zip
zip -r9 -                                    \
	"${foldername}/graphics/"            \
	"${foldername}/locale/"              \
	"${foldername}/logic/"               \
	"${foldername}/sound/"               \
	"${foldername}/support_aircraft/"    \
	"${foldername}/aircraftMaker.lua"    \
	"${foldername}/control.lua"          \
	"${foldername}/data.lua"             \
	"${foldername}/data-final-fixes.lua" \
	"${foldername}/settings.lua"         \
	"${foldername}/changelog.txt"        \
	"${foldername}/info.json"            \
	"${foldername}/thumbnail.png"        \
	> "${foldername}/${filename}"
