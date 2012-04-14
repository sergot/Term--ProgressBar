use v6;
use Test;
plan 1;

use Term::ProgressBar;

my $bar = Term::ProgressBar.new(count => 100);
my $r = ' ';

$*OUT = class {
	method print(*@args) {
		$r ~= @args.join;
	}
}

for 1..100 {
	$bar.update($_);
}

is $r, /100\%/;
