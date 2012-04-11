use v6;
class Term::ProgressBar;

has Int $.count = 100;
has Str $.name = " ";

has Bool $.p = True;

# optional
has $.blocka = '[';
has $.blockb = ']';
has $.style = '=';

#has $!width; TODO 
has $!as;

method update(Int $step) {
	my $multi = ($step/($.count/100)).floor;
	my $ext = ' ';
	if  $.p {
		$ext ~= $multi~"%";
	}
	if $step % ($.count/100).floor == 0 {
		$!as = "$.name "~$.blocka~($.style x $multi)~(' ' x (100 - $multi))~$.blockb~" $ext";
		print $!as, "\r";
	}
	say if $step == $.count;
}

method message(Str $s) {
	print ' ' x $!as.chars;
	say "\r", $s;
}
