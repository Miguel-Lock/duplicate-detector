use strict;
use warnings;

# Create an empty hash
my %hash_with_arrays;

# Dynamically add key-value pairs with arrays
$hash_with_arrays{key1} = [1, 2, 3];                   # An array reference
$hash_with_arrays{key2} = ["apple", "banana", "cherry"]; # An array of strings

# Add elements to the array associated with 'key1'
push @{$hash_with_arrays{key1}}, 4, 5, 6;

# Add an element to the array associated with 'key3'
push @{$hash_with_arrays{key3}}, 7;

# Access and print elements from the hash
print "Elements of key1: ", join(", ", @{$hash_with_arrays{key1}}), "\n";
print "Elements of key2: ", join(", ", @{$hash_with_arrays{key2}}), "\n";
print "Elements of key3: ", join(", ", @{$hash_with_arrays{key3}}), "\n";
