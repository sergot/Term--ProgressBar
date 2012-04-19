use v6;
class Term::ProgressBar;

has Int $.count = 100;
has Str $.name = " ";
has Int $.width = 100;

has Bool $.p;
has Bool $.t; # TODO: time

has $.left = '['; # TODO: better names?
has $.right = ']';
has $.style = '=';

has Str $!as = ""; # current string

has $!step = 0.0;

method update(Int $step) {
	my $start = nqp::p6box_n(pir::time__n());

	my $multi = ($step/($.count/$.width)).floor;
	my $ext = ' ';

	$ext ~= $multi*(100/$.width).round(0.1)~"%" if $.p;
	$ext ~= ' '~ (( $start - $!step ) * ( $.count - $step ) ).floor ~ ' s' ;

	if $step % ($.count/$.width).floor == 0 {
		$!as = "$.name "~$.left~($.style x $multi)~(' ' x ($.width - $multi))~$.right~" $ext";
		print $!as, "\r";
	}
	say '' if $step == $.count;

	$!step = $start;
}

method message(Str $s) {
	self!clear;
	say $s;
}

method !clear {
	print ' ' x $!as.chars, "\r";
}
