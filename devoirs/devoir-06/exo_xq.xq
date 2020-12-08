import module namespace sol = "exo_xquery_solveig" at "exo_xq.xqm";

let $text := unparsed-text('ronsard.txt')
return sol:countWords(sol:normalize($text))