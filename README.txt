BASIC INSTRUCTIONS
This gem re-ranks your playlist according to Pink Floyd band members chosen at random.
The re-ranked playlist is then exported to your current directory after the program has finished ('quit' to exit).

TO RUN DEFAULT CSV SHEET (THE WALL)):
songfile

TO RUN DARK SIDE OF THE MOON ALBUM SONGS:
songfile bin/DSOTM.csv

TO RUN A CSV FILE FROM YOUR CURRENT DIRECTORY:
songfile your_file_name.csv

NOTE: All CSV files must be formatted appropriately with:
No header or other text at the top 
Column 1: lists all song titles in plain text (The program will appropriately capitalize titles for you.)
Column 2: lists integer values for your song ranks (Any negative character "-" will be ignored. If left blank, a default rank of 10,000 is given.)
Low rank # means you want the song ranked higher on the playlist.
High rank # means you want the song ranked lower on the playlist.

