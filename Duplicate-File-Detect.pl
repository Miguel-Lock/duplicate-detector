use v5.10;
use Digest::MD5 qw(md5_hex);

#Miguel Lock



sub main {
    say "Did this even work?";
    my $md5 = md5_hex($MyPerlTest);
    say $md5;
    #how to view all files at every level within a directory perl
    #get input of file path from userinput
    #program traverses fie tree
    #if file is seen: find a hash value of the file
    #if hash_value exists as key in hash, count++
        #add hash_value to list: multiplied_files[]
    #else: enter that data into a hash, where key = hash_value, value = [path/filename, count=0]
    #at the end: print the path/filename of identical files

    #add option to auto-delete duplicates
    #add -h option
}

main();