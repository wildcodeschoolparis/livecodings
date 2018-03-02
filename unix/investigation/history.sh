# Print instructions (read)
cat instructions

# Change directory -> mystery/
cd mystery
# Look inside
ls .

# Print crimescene .. lot of data
cat crimescene

# filtrer lines containing "CLUE"
cat crimescene | grep CLUE
# grep CLUE crimescene

# -> a woman "Annabel" seems to be a suspect

# Print people file .. lot of data (header tells us how to search the streets)
cat people

# Search for all "Annabel" entries in 'people' file
grep Annabel people

# Annabel Sun F 26  Hart Place, line 40
# Oluwasegun Annabel  M 37  Mattapan Street, line 173
# Annabel Church  F 38  Buckingham Place, line 179
# Annabel Fuglsang  M 40  Haley Street, line 176

# -> 4 entries, we keep only Female ones (we are looking for a woman)

# Annabel Sun F 26  Hart Place, line 40
# Annabel Church  F 38  Buckingham Place, line 179

# Print a street (any) to look the content -> gibberish data (= charabia)
cat streets/Abbot_Street

# 'people' header tells us
# that in order to search for the 173, Mattapan Street
# we have to look at file streets/Mattapan_Street at line 173

# Print the 40 first lines of a file..
head -n 40 streets/Hart_Place

# .. and keep only last one (man/tldr tail)
head -n 40 streets/Hart_Place | tail -n 1
# -> SEE INTERVIEW #47246024

head -n 176 streets/Haley_Street | tail -1
# -> SEE INTERVIEW #871877

# Print interviews
cat interviews/interview-47246024
# -> [...] Not the witness from the cafe

cat interviews/interview-699607
# -> [...] blue Honda, with a license plate that starts with "L337" and ends with "9"

# Let's have a look at 'vehicles' file
cat vehicles

grep "L337" vehicles
# -> hmm.. we need more data, we should print the 5 following lines

# add some grep options -A (After) -B (Before) -C (both)
grep "L337" vehicles -A 5

# grep "L337.*9" vehicles -A 5 | tr '\n' ' ' | sed $'s/--/\\\n/g' | grep "Honda Color: Blue" | sed $'s/.*Owner:\ //g'

# Ok now we look for Blue Hondas owners

# Erika Owens
# Aron Pilhofer
# Heather Billings
# Joe Germuska
# Jeremy Bowers
# Jacqui Maher

# We can remove those with height lower than 6' (we search for a "tall man, at least 6' ")

# Joe Germuska
# Jeremy Bowers
# Jacqui Maher

# We will search for thoses who belongs to both AAA, Delta SkyMiles, the local library, and the Museum of Bash History
ls memberships
# -> AAA, Delta_SkyMiles, Museum_of_Bash_History, Terminal_City_Library
cd memberships
cat AAA
# -> list of members of AAA

cat AAA Delta_SkyMiles Museum_of_Bash_History Terminal_City_Library | grep -c "Joe Germuska"
# -> 2
cat AAA Delta_SkyMiles Museum_of_Bash_History Terminal_City_Library | grep -c "Jeremy Bowers"
# -> 4
cat AAA Delta_SkyMiles Museum_of_Bash_History Terminal_City_Library | grep -c "Jacqui Maher"
# -> 4

# Jeremy Bowers
# Jacqui Maher

cd ..

grep "Jeremy Bowers" people
head -n 284 streets/Dunstable_Road | tail -n 1
# -> SEE INTERVIEW #9620713
cat interviews/interview-9620713

# Home appears to be empty, no answer at the door.
# After questioning neighbors, appears that the occupant may have left for a trip recently.
# Considered a suspect until proven otherwise, but would have to eliminate other suspects to confirm.

# .... very suspect!

grep "Jacqui Maher" people
head -n 224 streets/Andover_Road | tail -n 1
# -> SEE INTERVIEW #904020
cat interviews/interview-904020

# -> Maher is not considered a suspect.

# "Jeremy Bowers" is definitly the murderer!

echo "Jeremy Bowers"
