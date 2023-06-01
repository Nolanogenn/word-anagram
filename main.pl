use strict;
use warnings;

my $file = './data/vocab.txt';
open my $info, $file or die "could not open file $file";

our %vocab = {};
while( my $line = <$info>){
	chomp $line;
	my @chars = split (//, $line);
	my @sorted_chars = sort @chars;
	my $char_key = join('', @sorted_chars); 
	unless (exists $vocab{$char_key}){
		$vocab{$char_key} = [];
	};
	push(@{$vocab{$char_key}}, $line);
};
close $info;

print "Write a word: ";
my $input_word = <STDIN>;
chomp $input_word;
my $input_word_lc = lc $input_word;

print "the word is $input_word\n";
my @input_word_chars = split (//, $input_word_lc);
my @sorted_input_word_chars = sort @input_word_chars;
my $input_word_char_key = join('', @sorted_input_word_chars);

print "possible anagrams: @{ $vocab{$input_word_char_key}}\n";
