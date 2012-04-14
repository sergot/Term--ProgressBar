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

is $r, /100\%/;
