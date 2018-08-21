# Loop over all abstracts and write the output to abstracts.txt

for abstract in $(cat TDWG_abstracts.txt); do 

    # Strip off just abstract number
    anum=$(echo $abstract | sed 's/\/article\///g;s/\/download\/xml\///g;') 

    # Download XML representation of Abstracts
    wget "https://biss.pensoft.net${i}" -O $anum.xml ; done

    # Extract just Abstract text from XML using XPATH
    xmllint --xpath "/article/front/article-meta/abstract" $anum.xml | pandoc --from html --to markdown >> abstracts.txt
    
done