# SPNHC-TDWG 2018

I wanted to leverage the body of text in the SPNHC-TDWG abstracts that were made available online at https://biss.pensoft.net/ to better understand the SPNHC-TDWG community before my keynote at the conference. I was also looking to get a bit more experience with the tidytext package. 

This repository contains the code I used. The list of xml pages had to be manually extracted from the JavaScript rendered dynamic proceedings page https://biss.pensoft.net/collection/62. I pasted the rendered HTML from the Chrome inspector into a text file and used `grep` to return just the xml file link fragments. The list of link fragments is included as `TDWG_abstracts.txt`. Using `wget` I iterated over all link fragments and downloaded the HTML files. Using `xmllit` with the `--xpath` option and `pandoc` (to strip out tags). I was able to create a single text file with all of the abstracts for the conference.  See `get_data.sh` for those steps.

