<?php

function is_anagram($a, $b) {
	$arr_a = str_split($a);
	$arr_b = str_split($b);

	sort($arr_a);
	sort($arr_b);

	if (join("", $arr_a) === join("", $arr_b)) {
		echo "true";
	} else  { echo "false"; }
}

is_anagram("silent", "listen");
is_anagram("letter", "silent");
is_anagram("letter", 123456);
is_anagram("letter", 12345);
is_anagram("lette", "123sil");
