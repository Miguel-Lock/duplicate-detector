use v5.10;
use Digest::MD5 qw(md5_hex);
use strict;
use warnings;
use File::Find;
use Cwd;

our %md5hash;
our @duplicated;

# Define the callback function to process each file and directory
sub process_file {
    my $file = $File::Find::name;

    if (!-d $file) {
        open my $fh, '<', $file or die "Could not open file '$file': $!"; # Open the file for reading.

        my $md5 = Digest::MD5->new;

        # Read the file line by line and update the MD5 hash.
        while (<$fh>) {
            $md5->add($_);
        }

        close $fh; # Close the file.

        my $md5sum = $md5->hexdigest;

        #say $md5sum;
        #say $file;

        if (exists($md5hash{$md5sum})) {
            push @{$md5hash{$md5sum}}, $file;

            if (scalar @{$md5hash{$md5sum}} == 2) {
                push @duplicated, $md5sum;
            }
        } else {
            push @{$md5hash{$md5sum}}, $file;
        }

        #print("\n");
    }
}

sub remove_duplicates {
    my %seen;

    # Initialize a new array to store the unique elements
    my @duplicated;

    my @unique_array;

    for my $element (@duplicated) {
        unless ($seen{$element}) {
            push @unique_array, $element;
            $seen{$element} = 1;
        }
    }

    # Update the global array with the unique values
    @duplicated = @unique_array;
}

sub main {

    # Define the directory you want to search
    my $directory = cwd;

    # Use File::Find to traverse the directory and call the callback function
    find(\&process_file, $directory);

    #remove_duplicates();

    #foreach my $element (@duplicated) {
    #    print("$element\n");
    #    say $md5hash{$element};
    #}

    foreach my $md5_key (@duplicated) {
        print("$md5_key\n");
        my @values = @{$md5hash{$md5_key}};
        say join("\n", @values);
        print("\n\n");
    }


    #if md5 exists as a key in hash:
    #   increment value at md5
    #   md5[].append(dir)
    #   if value=1:
    #       add multiplied_files[].append(md5)
    #else:
    #   add md5 as key in hash, value = 0
    #   create array md5[dir]
    #at the end: print the path/filename of identical files


    #add option for user to input files (default .)
    #add ability to use . as default
    #add option to auto-delete duplicates
    #add -h option
    #exclude .git folders
}

main();