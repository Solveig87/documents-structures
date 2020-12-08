module namespace sol="exo_xquery_solveig";

declare function sol:normalize($text as xs:string*) as xs:string* {
let $ponctuations := "?!;.,"""
for $line in tokenize($text,'\n')
return translate(translate($line, $ponctuations, ""), "'", " ") => lower-case() => tokenize(' ')
};

declare function sol:countWords($list as xs:string*) as node() {
( <dictionnaire> {
for $word in distinct-values($list)
return if ($word != "") then <mot frequence="{count(for $token in $list return if ($token = $word) then $token else ())}">{$word}</mot> else ()}
</dictionnaire> )
};