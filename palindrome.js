function palindrome(a) {
	a = a.toString().toLowerCase().replace(/[^a-z0-9]/g,"");
	if (a === a.split("").reverse().join("")) {
		return true;
	} else { return false; }
}

console.log(palindrome("Amore, Roma"));
console.log(palindrome("A man, a plan, a canal: Panama"));
console.log(palindrome("No ‘x’ in ‘Nixon’"));