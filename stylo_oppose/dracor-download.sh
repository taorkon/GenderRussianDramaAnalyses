for play in `curl 'https://dracor.org/api/corpora/rus' | jq -r ".dramas[] .name"`; do
	year=`curl 'https://dracor.org/api/corpora/rus' | jq -r '.dramas[] | select(.name=='\"$play\"') | .yearNormalized'`
    wget -O "$year-$play".txt https://dracor.org/api/corpora/rus/play/"$play"/spoken-text?gender=MALE
done
