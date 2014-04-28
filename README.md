wikidata-autocomplete
=====================

uses [wikidata API](https://www.wikidata.org/w/api.php) search to fill an input.
Doesn't work very well as such, it does search but can't suggest autocomplete:
if I'm look for "Les Misérables", it will successivelly do the following requests:

```
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les M"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Mi"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Mis"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Misé"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Misér"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Miséra"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Misérab"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Misérabl"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Misérable"
"https://www.wikidata.org/w/api.php?action=wbsearchentities&language=fr&format=json&search=Les Misérables"
```

Then adding all the results to [jQuery Autocomplete](http://jqueryui.com/autocomplete/)array `availableTags`

not very efficient... any suggestion?

Setup
=======
```
git clone git@github.com:maxlath/wikidata-autocomplete.git
npm install
coffee ./cors-proxy.coffee 3001
```
this last command starts a proxy to allow queries to wikidata from the browser
(could probably be done server-side, but it seemed easier this way)

then I start a minimalist server with `python -m SimpleHTTPServer` and go to `http://localhost:8000/autocomplete.html`
Would do something cleaner if it gets somewhere.
