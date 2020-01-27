#!/bin/bash
chars=(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9);
for a in ${chars[@]}; do
	for b in ${chars[@]}; do
		for c in ${chars[@]}; do
			for d in ${chars[@]}; do
				for e in ${chars[@]}; do
					for f in ${chars[@]}; do
						echo "Scanning https://prnt.sc/$a$b$c$d$e$f";
						g=`curl --silent "https://prnt.sc/$a$b$c$d$e$f" -H 'authority: prnt.sc' -H 'pragma: no-cache' -H 'cache-control: no-cache' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'sec-fetch-site: none' -H 'sec-fetch-mode: navigate' -H 'accept-encoding: gzip, deflate' -H 'accept-language: en,ru;q=0.9,en-US;q=0.8' -H 'cookie: __cfduid=PUT YOUR OWN CF TOKEN HERE' --compressed`
						h=`echo $g | grep -o -P 'https://image.prntscr.com/.{0,100}' | cut -d '"' -f 1 | uniq;`
						i=`echo $g | grep -o -P 'https://i.imgur.com/.{0,100}' | cut -d '"' -f 1 | uniq;`
						if [[ ! -z $h ]]; then
							echo "Match found: $h";
							j=`echo $h | cut -d '/' -f 4`;
							wget -q "$h" -O img/$j;
						fi;
						if [[ ! -z $i ]]; then
							echo "Match found: $i";
							k=`echo $i | cut -d '/' -f 4`;
							wget -q "$i" -O img/$k;
						fi;
					done;
				done;
			done;
		done;
	done;
done;
exit;
