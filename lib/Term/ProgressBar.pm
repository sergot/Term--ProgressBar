use v6;
class Term::ProgressBar;

has Int $.count = 100;
has Str $.name = " ";

has Bool $.p;

# optional
has $.blocka = '[';
has $.blockb = ']';
has $.style = '=';

has Int $.width = 100;

has Str $!as;

method update(Int $step) {
	my $multi = ($step/($.count/$.width)).floor;
	my $ext = ' ';
	if  $.p {
		$ext ~= $multi*(100/$.width).round(0.1)~"%";
	}
	if $step % ($.count/$.width).floor == 0 {
		$!as = "$.name "~$.blocka~($.style x $multi)~(' ' x ($.width - $multi))~$.blockb~" $ext";
		print $!as, "\r";
	}
	say if $step == $.count;
}

method message(Str $s) {
	self!clear;
	say $s;
}

method !clear {
	print ' ' x $!as.chars;
	print "\r";
}
